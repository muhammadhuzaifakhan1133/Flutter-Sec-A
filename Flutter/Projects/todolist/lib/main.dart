import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todolist/functions/firebase.dart';
import 'package:todolist/provider/google_sign_in.dart';
import 'package:todolist/screens/email_verify/email_verify.dart';
import 'package:todolist/screens/home/home.dart';
import 'package:todolist/screens/push_with_internet_checking/push_with_intenet_checking.dart';
import 'package:todolist/screens/splash/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final prefs = await SharedPreferences.getInstance();
  String? name = prefs.getString("activeName");
  late Widget home;
  if (name == null) {
    home = const SplashScreen();
  } else {
    if (await checkEmailVerified()) {
      home = PushWithCheckingInternet(destination: Home(name: name));
    } else {
      home = EmailVerification(name: name);
    }
  }
  runApp(ChangeNotifierProvider(
    create: (context) => GoogleSignInProvider(),
    child: MaterialApp(debugShowCheckedModeBanner: false, home: home),
  ));
}
