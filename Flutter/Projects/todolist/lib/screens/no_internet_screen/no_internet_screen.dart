import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:todolist/screens/home/home.dart';

class NoInternetConnection extends StatefulWidget {
  NoInternetConnection({required this.name, Key? key}) : super(key: key);
  String name;
  @override
  State<NoInternetConnection> createState() => _NoInternetConnectionState();
}

class _NoInternetConnectionState extends State<NoInternetConnection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage("assets/images/no_internet_connection.png"),
              height: 100,
            ),
            const SizedBox(height: 10),
            const Text("No Internet Connection"),
            const SizedBox(height: 30),
            ElevatedButton(
                onPressed: () async {
                  bool connection =
                      await InternetConnectionChecker().hasConnection;
                  if (connection) {
                    // ignore: use_build_context_synchronously
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Home(name: widget.name)),
                        (route) => false);
                  } else {
                    Fluttertoast.showToast(msg: "No Internet Connection");
                  }
                },
                child: const Text("Retry"))
          ],
        ),
      ),
    );
  }
}
