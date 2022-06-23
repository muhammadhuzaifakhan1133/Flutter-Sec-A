import 'package:class1/constants/local_storage_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
Future<void> saveLoginValues(name, email, password) async {
  final SharedPreferences prefs = await _prefs;
  await prefs.setString(activeNameKey, name);
  await prefs.setString(activeEmailKey, email);
  await prefs.setString(activePasswordKey, password);
}
