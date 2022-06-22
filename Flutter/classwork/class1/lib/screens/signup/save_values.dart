import 'package:shared_preferences/shared_preferences.dart';

final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
saveValues(name, email, password) async {
  final SharedPreferences prefs = await _prefs;
  List<String>? names = prefs.getStringList('names');
  List<String>? emails = prefs.getStringList('emails');
  List<String>? passwords = prefs.getStringList('passwords');
  if ((emails == null) && (passwords == null) && (names == null)) {
    List<String> new_names = [name];
    List<String> new_emails = [email];
    List<String> new_passwords = [password];
    await prefs.setStringList('names', new_names);
    await prefs.setStringList('emails', new_emails);
    await prefs.setStringList('passwords', new_passwords);
  } else {
    names!.add(name);
    emails!.add(email);
    passwords!.add(password);
    await prefs.setStringList('names', names);
    await prefs.setStringList('emails', emails);
    await prefs.setStringList('passwords', passwords);
  }
}
