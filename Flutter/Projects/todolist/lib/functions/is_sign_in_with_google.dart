import 'package:shared_preferences/shared_preferences.dart';

final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
Future<bool> isSignInWithGoogle() async {
  final SharedPreferences prefs = await _prefs;
  bool isSignInWithGoogle = prefs.getBool("isSignInWithGoogle")!;
  return isSignInWithGoogle;
}
