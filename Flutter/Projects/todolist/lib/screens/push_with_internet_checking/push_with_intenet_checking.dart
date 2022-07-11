import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:todolist/screens/internet_not_connected/internet_not_connected.dart.dart';

class PushWithCheckingInternet extends StatefulWidget {
  const PushWithCheckingInternet({required this.destination, Key? key})
      : super(key: key);
  final Widget destination;

  @override
  State<PushWithCheckingInternet> createState() =>
      _PushWithCheckingInternetState();
}

class _PushWithCheckingInternetState extends State<PushWithCheckingInternet> {
  bool? isDeviceConnected;
  late StreamSubscription<ConnectivityResult> subscription;

  CheckInternetConnectivity() {
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) async {
      if (result != ConnectivityResult.none) {
        bool value = await InternetConnectionChecker().hasConnection;
        setState(() {
          isDeviceConnected = value;
        });
      } else {
        setState(() {
          isDeviceConnected = false;
        });
      }
    });
  }

  @override
  void initState() {
    CheckInternetConnectivity();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: (isDeviceConnected == null)
            ? Center(child: CircularProgressIndicator())
            : (isDeviceConnected == false)
                ? InternetNotConnected(onpressed: () {
                    CheckInternetConnectivity();
                  })
                : widget.destination);
  }
}
