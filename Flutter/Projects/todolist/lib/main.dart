import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todolist/functions/firebase.dart';
import 'package:todolist/screens/email_verify/email_verify.dart';
import 'package:todolist/screens/home/home.dart';
import 'package:todolist/screens/no_internet_screen/no_internet_screen.dart';
import 'package:todolist/screens/splash/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final prefs = await SharedPreferences.getInstance();
  String? name = prefs.getString("activeName");
  bool connection = await InternetConnectionChecker().hasConnection;
  late Widget home;
  if (name == null) {
    home = const SplashScreen();
  } else {
    if (await checkEmailVerified()) {
      if (connection) {
        home = Home(name: name);
      } else {
        home = NoInternetConnection(name: name);
      }
    } else {
      home = EmailVerification(name: name);
    }
  }
  runApp(MyApp(home: home));
}

class MyApp extends StatelessWidget {
  final Widget home;
  const MyApp({this.home = const Scaffold(), Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: home,
    );
  }
}
