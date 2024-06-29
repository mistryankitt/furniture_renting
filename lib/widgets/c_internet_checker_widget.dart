import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:gurniturerenting/utils/c_variable.dart';
import 'package:gurniturerenting/widgets/constants.dart';


class InternetConnectionChecker extends StatefulWidget {
  final Widget child;
  final Function() onRefresh;
  InternetConnectionChecker({required this.child, required this.onRefresh});

  @override
  _InternetConnectionCheckerState createState() =>
      _InternetConnectionCheckerState();
}

class _InternetConnectionCheckerState extends State<InternetConnectionChecker> {
   bool isConnected = true;
   bool isLoading = false;

  @override
  void initState() {
    super.initState();
    checkConnectivity();
  }

  Future<void> checkConnectivity() async {

    var net = await checkInternetConnection(context);
    debugPrint("internet connection check value ====>$net");
    if(mounted)
    if (await checkInternetConnection(navigatorKey.currentState!.context) == false) {
      customToastShow("Network Error', 'Failed to get network connection");
      setState(() {
        isConnected = false;
        isLoading = false;

      });
      return null;
    }
    setState(() {
      isConnected =  true;
      isLoading = false;
    });
  }

   /// check internet connection is available
   //todo: check internet connection is available
   Future<bool> checkInternetConnection(context) async {
     bool networkStatus;
     ConnectionStatusSingleton connectionStatus =
     ConnectionStatusSingleton.getInstance();
     connectionStatus.initialize();
     networkStatus = connectionStatus.hasConnection;
     return networkStatus;
   }





   Future<void> _refresh() async {
    widget.onRefresh();
    await Future.delayed(const Duration(seconds: 2));
    checkConnectivity();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading == true) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else if (!isConnected) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("No internet connection"),
            ElevatedButton(
              onPressed: checkConnectivity,
              child: Text("Retry"),
            ),
          ],
        ),
      );
    } else {
      return RefreshIndicator(
        onRefresh: _refresh,
        child: widget.child,
      );
    }
  }
}



class ConnectionStatusSingleton {
  //This creates the single instance by calling the `_internal` constructor specified below
  static final ConnectionStatusSingleton _singleton =
  ConnectionStatusSingleton._internal();

  ConnectionStatusSingleton._internal();

  //This is what's used to retrieve the instance through the app
  static ConnectionStatusSingleton getInstance() => _singleton;

  //This tracks the current connection status
  bool hasConnection = false;

  //This is how we'll allow subscribing to connection changes
  StreamController connectionChangeController = StreamController.broadcast();

  //flutter_connectivity
  final Connectivity _connectivity = Connectivity();

  //Hook into flutter_connectivity's Stream to listen for changes
  //And check the connection status out of the gate
  void initialize() {
    _connectivity.onConnectivityChanged.listen(_connectionChange);
    checkConnection();
  }

  Stream get connectionChange => connectionChangeController.stream;

  //A clean up method to close our StreamController
  //   Because this is meant to exist through the entire application life cycle this isn't
  //   really an issue
  void dispose() {
    connectionChangeController.close();
  }

  //flutter_connectivity's listener
  void _connectionChange(ConnectivityResult result) {
    checkConnection();
  }

  //The test to actually see if there is a connection
  Future<bool> checkConnection() async {
    bool previousConnection = hasConnection;

    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        hasConnection = true;
      } else {
        customToastShow(
            "Network Error', please check your internet connection");

        hasConnection = false;
      }
    } on SocketException catch (_) {
      hasConnection = false;
    }

    //The connection status changed send out an update to all listeners
    if (previousConnection != hasConnection) {
      connectionChangeController.add(hasConnection);
    }

    return hasConnection;
  }
}
