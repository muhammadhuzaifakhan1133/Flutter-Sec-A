import 'package:shared_preferences/shared_preferences.dart';

final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
Future<void> setSignInAsGoogleOrNot(bool value) async {
  final SharedPreferences prefs = await _prefs;
  prefs.setBool("isSignInWithGoogle", value);
}
