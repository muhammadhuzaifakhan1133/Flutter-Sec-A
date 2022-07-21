import 'package:ecommerce/firebase_options.dart';
import 'package:ecommerce/functions/firebase.dart';
import 'package:ecommerce/screens/bottom_bar_controller/bottom_bar_controller.dart';
import 'package:ecommerce/screens/email_verify/email_verify.dart';
import 'package:ecommerce/screens/login/login_screen.dart';
import 'package:ecommerce/screens/provider/google_sign_in.dart';
import 'package:ecommerce/screens/splash_screen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      home = const BottomBarController();
    } else {
      home = EmailVerificationScreen(name: name);
    }
  }
  runApp(ChangeNotifierProvider(
    create: (context) => GoogleSignInProvider(),
    child: MaterialApp(debugShowCheckedModeBanner: false, home: home),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
