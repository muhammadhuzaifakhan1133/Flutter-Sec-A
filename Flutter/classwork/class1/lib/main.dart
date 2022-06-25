import 'package:class1/constants/color_constants.dart';
import 'package:class1/constants/local_storage_keys.dart';
import 'package:class1/screens/home/home.dart';
import 'package:class1/screens/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  // List<String> all_key = [namesKey, emailsKey, passwordsKey];
  // List<String> all_key2 = [activeNameKey, activeEmailKey, activePasswordKey];
  // for (var key in all_key) {
  //   var value = prefs.getStringList(key);
  //   print("$key : $value");
  // }
  // for (var key in all_key2) {
  //   var value = prefs.getString(key);
  //   print("$key : $value");
  // }
  String? active = prefs.getString(activeEmailKey);
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primaryColor: backgroundColor),
    home: active == null ? const SplashScreen() : const Home(),
  ));
}
