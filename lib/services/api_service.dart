import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:get/get.dart';

import 'package:gurniturerenting/utils/c_loading.dart';
import 'package:gurniturerenting/utils/c_variable.dart';
import 'package:gurniturerenting/widgets/c_snackbar.dart';
import 'package:http/http.dart' as http;

enum APIType { tPost, tGet, tPut, tMultiPartPost, tMultipleMultipart }

class API {
  static Future<dynamic> callAPI(
      {required String url,
        required APIType type,
        Map<String, dynamic>? body,
        Map<String, String>? header,
        String? path,
        bool isPopLoading = true,
        String? imageMapName,
        String? multiImagesMapName,
        List<File>? multiImagesPath}) async {
    try {
      log(url);
      log("API request body: ===> $body");
      // debugPrint(body as String?);
      // LanguageController controller =
      //     Get.find(tag: LanguageController().toString());
      http.Response? apiResponse;
      http.StreamedResponse? apiStreamResponse;
      // String apiBody = jsonEncode(body);
      dynamic apiBody = body;

      var loginToken =
      VariableUtilities.prefs.read(VariableUtilities.loginToken);
      log("login token : $loginToken");

      /// this is the very important and required for all the apis of any kinds in this application.
      Map<String, String> appHeader = {
        "access-token": loginToken ?? '', // this is the login token.
      };

      /// token has same importance as secret key.
      /// we can get token after login and registration apis.
      /// and all other apis exept login and registration will require the token also with the secret key.
      // if (url != APIUtilities.loginUrl &&
      //     url != APIUtilities.registrationUrl &&
      //     url != APIUtilities.biometricsVerifyUrl) {
      //   String token = VariableUtilities.prefs?.read("token") ?? "";
      //   if (token != "") {
      //     appHeader.addAll(
      //       {
      //         "Authorization": token,
      //       },
      //     );
      //   }
      // }

      /// if there are any other header for different kind of apis then attach
      /// dynamically passed parameters.
      if (header != null) {
        appHeader.addAll(header);
      }

      /// [POST CALL]
      if (type == APIType.tPost) {
        assert(body != null);
        isPopLoading == true ? postApiLoading(false) : null;
        appHeader.addAll({"Content-type": "application/json"});

        /// call the api with the specified url using post method.
        apiResponse = await http.post(
          Uri.parse(url),
          body: jsonEncode(apiBody),
          headers: appHeader,
        );
        isPopLoading == true ? postApiLoading(true) : null;
      }

      /// [MULTI PART POST CALL]
      else if (type == APIType.tMultiPartPost) {
        assert(body != null);
        postApiLoading(false);
        appHeader.addAll({"Content-type": "application/json"});

        /// call the api with the specified url using post method.
        //  postApiLoading(false);
        final apiRequest = http.MultipartRequest(
          'POST',
          Uri.parse(url),
        )
          ..headers.addAll(appHeader)
          ..fields.addAll(apiBody);
        if (path != null) {
          apiRequest.files.add(await http.MultipartFile.fromPath(
              '$imageMapName', path));
        } else {
          apiRequest.fields["$imageMapName"] = "";
        }

        apiStreamResponse = await apiRequest.send();
        loggerPrint(
            print:
            '######### Response ###### \t \n ${apiStreamResponse.statusCode.toString()}');
        var decodeData = await apiStreamResponse.stream.bytesToString();
        var decodeJson = json.decode(decodeData.toString());
        // log( decodeJson.toString());
        postApiLoading(true);
        return decodeJson;
        // apiResponse = await http.m(
        //   Uri.parse(url),
        //   body: jsonEncode(apiBody),
        //   headers: appHeader,
        // );
      }

      /// [GET CALL]
      else if (type == APIType.tGet) {
        /// call the api with the specified url using get method.
        apiResponse = await http.get(
          Uri.parse(url),
          headers: appHeader,
        );
      }

      /// [MULTI PART POST CALL]
      else if (type == APIType.tMultipleMultipart) {
        assert(body != null);
        postApiLoading(false);
        appHeader.addAll({"Content-type": "application/json"});

        /// call the api with the specified url using post method.
        //  postApiLoading(false);

        final apiRequest = http.MultipartRequest(
          'POST',
          Uri.parse(url),
        )
          ..headers.addAll(appHeader)
          ..fields.addAll(apiBody);
        if (path != null) {
          apiRequest.files
              .add(await http.MultipartFile.fromPath('$imageMapName', path));
        } else {
          apiRequest.fields["$imageMapName"] = "";
        }

        for (int i = 0; i < multiImagesPath!.length; i++) {
          var image = multiImagesPath[i];
          var stream = http.ByteStream(image.openRead());
          var length = await image.length();

          var multipartFile = http.MultipartFile(
              "$multiImagesMapName", stream, length,
              filename: "${File(image.path)}");

          apiRequest.files.add(multipartFile);
        }

        apiStreamResponse = await apiRequest.send();

        loggerPrint(
            print:
            '######### Response ###### \t \n ${apiStreamResponse.statusCode.toString()}');
        var decodeData = await apiStreamResponse.stream.bytesToString();
        // log( decodeData);
        var decodeJson = json.decode(decodeData);
        log(decodeJson.toString());
        postApiLoading(true);

        return decodeJson;
      } else {
        /// call the api with hte specified url using put method.
        apiResponse = await http.put(
          Uri.parse(url),
          body: apiBody,
          headers: appHeader,
        );
      }

      /// logger package used to log the output on the console.
      // dev_logs.Logger().d(apiResponse.body);

      //  final decodeJson = json.decode(apiResponse.body);
      //
      //   //  log(url);
      // log( decodeJson.toString());
      //  log(appHeader.toString());
      //  log(apiResponse.headers.toString());

      late Map<String, dynamic> response;
      if (apiResponse.headers["content-type"] == "application/pdf") {
        response = {
          "status": 200,
        };
      } else {
        log(apiResponse.body.toString());
        response = jsonDecode(apiResponse.body);
      }

      switch (apiResponse.statusCode) {
        case 200:
          if (response["status"] is String
              ? response["status"] == "Success"
              : response["status"]) {
            log(url);

            // /// if the api is returning the pdf then direct send the file data...
            // if (apiResponse.headers["content-type"] == "application/pdf") {
            //   return apiResponse.bodyBytes;
            // }

            /// when all the things are fine and api call is success then return the response...
            return response;
          } else {
            /// where there is any error from the server, then return null and show the message.
            showMySnackBar(
              title: response["code"].toString(),
              message: response["message"].toString(),
              type: SnackType.error,
            );
            return null;
          }

        case 500: // server error !
        /// when the error is from server side then it manage the response and show the snack accordingly.
          showMySnackBar(
            title: response["code"].toString(),
            message: response["message"].toString(),
            type: SnackType.error,
          );
          return null;

        case 404: // page not found !

        /// when the page called from the application is not found then it show the message.
          showMySnackBar(
            title: response["code"].toString(),
            message: response["message"].toString(),
            type: SnackType.error,
          );
          return null;
        case 400: // bad request !

        /// when the request is made with some mistakes or bad or improper parameters this part will execute.
          showMySnackBar(
            title: response["code"].toString(),
            message: response["message"].toString(),
            type: SnackType.error,
          );
          return null;

        case 401:

        /// when there are some authorization error.
          showMySnackBar(
            title: response["code"].toString(),
            message: response["message"].toString(),
            type: SnackType.error,
          );

          /// token will expire after some time..
          /// so, when user call api with the old token then user again need to take new token using the login api.
          /// so, to get new token user will redirected to the login screen when get bellow error message from api.
          if (response["message"].toString() ==
              "Request isn't authorized without token") {
            VariableUtilities.prefs
                .write("gift4all", false); // setting login session
            //Get.toNamed(RoutesUtilities.loginScreen);
          }
          return null;
        default:

        /// when there is some other errors like server, page-not-found, bad connection then it will return null.
          showMySnackBar(
            title: "apiManagerValidationTitleMessage".tr,
            message: "apiManagerValidationDefaultMessage".tr,
            type: SnackType.error,
          );
          return null;
      }
    } on TimeoutException catch (e) {
      log("time out");
      throw Exception('Request timed out');
    } on http.ClientException catch (e) {
      log("Failed to connect to server");

      throw Exception('Failed to connect to server');
    } catch (e, stacktrace) {
      log("Unknown error: $stacktrace");

      throw Exception('Unknown error: $stacktrace');
    }
  }

  static basename(path) {
    final paths = "giftReceipt$path";
    return paths;
  }
}
