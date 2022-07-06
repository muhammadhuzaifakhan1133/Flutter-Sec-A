import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todolist/screens/home/home.dart';
import 'package:todolist/screens/splash/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final prefs = await SharedPreferences.getInstance();
  // runApp(const MyApp());
  String? email = prefs.getString("activeEmail");
  String? name = prefs.getString("activeName");

  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ((email == null) && (name == null))
          ? const SplashScreen()
          : Home(name: name, email: email)));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      theme: ThemeData(primaryColor: Colors.blue),
    );
  }
}
