import 'package:shared_preferences/shared_preferences.dart';

final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

saveAsActiveUser(String name) async {
  final SharedPreferences prefs = await _prefs;
  prefs.setString("activeName", name);
}

Future<void> removeActiveUser() async {
  final SharedPreferences prefs = await _prefs;
  prefs.remove("activeName");
}

Future<void> setSignInAsGoogleOrNot(bool value) async {
  final SharedPreferences prefs = await _prefs;
  prefs.setBool("isSignInWithGoogle", value);
}

Future<bool> isSignInWithGoogle() async {
  final SharedPreferences prefs = await _prefs;
  bool isSignInWithGoogle = prefs.getBool("isSignInWithGoogle")!;
  return isSignInWithGoogle;
}
