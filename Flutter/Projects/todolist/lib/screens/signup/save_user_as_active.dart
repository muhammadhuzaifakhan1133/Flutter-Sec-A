import 'package:shared_preferences/shared_preferences.dart';

final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

saveAsActiveUser(String email, String name) async {
  final SharedPreferences prefs = await _prefs;
  prefs.setString("activeEmail", email);
  prefs.setString("activeName", name);
}
