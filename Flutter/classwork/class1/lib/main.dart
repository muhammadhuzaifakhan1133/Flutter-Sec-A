import 'package:class1/constants/color_constants.dart';
import 'package:class1/functions/shared_preferences.dart';
import 'package:class1/screens/home/home.dart';
import 'package:class1/screens/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  // List<List<String>> values = await getUsers();
  // List<String> allEmails = values[0];
  // for (var email in allEmails) {
  //   List<String> allLists = await getList(email);
  //   for (var list in allLists) {
  //     prefs.remove(email);
  //     prefs.remove(email + list);
  //     prefs.remove(email + list + taskImportancyKey);
  //     prefs.remove(email + list + taskImportancyKey);
  //     prefs.remove(email + list + taskDateKey);
  //     prefs.remove(email + list + taskTimeKey);
  //   }
  // }
  List<String?> userValues = await getActiveUser();
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
