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
