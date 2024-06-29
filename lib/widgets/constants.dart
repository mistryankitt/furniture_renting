import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:gurniturerenting/widgets/c_text.dart';
import 'package:velocity_x/velocity_x.dart';

//todo Colors
const Color primary = Color.fromRGBO(176, 173, 190, 1.0);
const Color inputGrayBorder = Color.fromRGBO(220, 220, 220, 1.0);
const Color inputGrayText = Color.fromRGBO(191, 191, 191, 1.0);
const Color footerActiveTab = Color.fromRGBO(255, 255, 255, 1.0);
const Color footerGrayTab = Color.fromRGBO(124, 151, 165, 1.0);
const Color green = Color.fromRGBO(85, 217, 0, 1.0);
const Color blackColor = Color.fromRGBO(0, 0, 0, 1.0);

Color fromHex(String hexColor) {
final hexCode = hexColor.replaceAll('#', '');
return Color(int.parse('FF$hexCode', radix: 16));
}

//todo custom height and width
mediaHeight(context) => MediaQuery.of(context).size.height;

mediaWidth(context) => MediaQuery.of(context).size.width;

class CustomPaddingAllScreen extends StatelessWidget {
  final Widget child;

  const CustomPaddingAllScreen({Key? key, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14),
      child: child,
    );
  }
}

final lineDivider = Container(
  height: 1.h,
  width: double.infinity,
  color: inputGrayText,
);

///email validation
MultiValidator emailValidation() {
  return MultiValidator([
    RequiredValidator(errorText: "* Email is required"),
    EmailValidator(errorText: "please enter valid email"),
  ]);
}

///number validation
MultiValidator numberValidation() => MultiValidator([
      RequiredValidator(errorText: "* Number is Required"),
      MinLengthValidator(7, errorText: "Number must be at least 7 digits long"),
      MaxLengthValidator(15, errorText: "Number should not exceed 15 digits")
      // PatternValidator('^(+d{1,2}s)?(?d{3})?[s.-]?d{3}[s.-]?d{4}',
      //     errorText: "Enter valid Phone Number"),
    ]);

///first validation
MultiValidator firstnameValidation() {
  return MultiValidator([
    RequiredValidator(errorText: "* First name is required"),
  ]);
}

///first validation
MultiValidator lastnameValidation() {
  return MultiValidator([
    RequiredValidator(errorText: "* Last name is required"),
  ]);
}

///password validation
MultiValidator passValidation() => MultiValidator([
      RequiredValidator(errorText: "* password is required"),
      MinLengthValidator(6,
          errorText: "password must be at least 6 digits long"),
      MaxLengthValidator(15,
          errorText: "password must be at least 15 digits long")
    ]);

Widget cTextWithFormWidget(
    {required String text,
    required Widget widget,
    required bool isRequiredField}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    children: [
      // TextSpan(
      //   text:    CSemiBoldText(text: text)
      // ),
      Row(
        children: [
          CSemiBoldText(text: text),
          isRequiredField == true
              ? CSemiBoldText(
                  text: "*",
                  color: primary,
                )
              : Container(),
        ],
      ),
      10.heightBox,
      widget,
    ],
  );
}

//todo: custom show toast message
void customToastShow(String msg) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0);
}
