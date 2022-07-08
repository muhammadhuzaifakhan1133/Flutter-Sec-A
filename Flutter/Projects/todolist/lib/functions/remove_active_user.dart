import 'package:shared_preferences/shared_preferences.dart';

final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
Future<void> removeActiveUser() async {
  final SharedPreferences prefs = await _prefs;
  prefs.remove("activeEmail");
  prefs.remove("activeName");
}
