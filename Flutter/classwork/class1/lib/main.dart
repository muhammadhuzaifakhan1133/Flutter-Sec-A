import 'package:class1/constants/color_constants.dart';
import 'package:class1/functions/shared_preferences.dart';
import 'package:class1/screens/home/home.dart';
import 'package:class1/screens/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  Future<List<String?>> futureUserValues = getActiveUser();
  List<String?> userValues = await futureUserValues;
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: backgroundColor),
      home: userValues.where((e) => e == null).toList().isNotEmpty
          ? const SplashScreen()
          : Home(
              userEmail: userValues[0]!,
              userName: userValues[1]!,
            )));
}
