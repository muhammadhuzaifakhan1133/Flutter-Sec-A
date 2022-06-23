import 'package:class1/constants/local_storage_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
saveSignUpValues(name, email, password) async {
  final SharedPreferences prefs = await _prefs;
  List<String>? names = prefs.getStringList(namesKey);
  List<String>? emails = prefs.getStringList(emailsKey);
  List<String>? passwords = prefs.getStringList(passwordsKey);
  if ((emails == null) || (passwords == null) || (names == null)) {
    List<String> nameToAdd = [];
    nameToAdd.add(name);
    List<String> emailToAdd = [];
    emailToAdd.add(email);
    List<String> passwordToAdd = [];
    passwordToAdd.add(password);
    await prefs.setStringList(namesKey, nameToAdd);
    await prefs.setStringList(emailsKey, emailToAdd);
    await prefs.setStringList(passwordsKey, passwordToAdd);
    print("In first Section");
    print(nameToAdd);
    print(emailToAdd);
    print(passwordToAdd);
  } else {
    names.add(name);
    emails.add(email);
    passwords.add(password);
    await prefs.setStringList(namesKey, names);
    await prefs.setStringList(emailsKey, emails);
    await prefs.setStringList(passwordsKey, passwords);
    await prefs.setString(activeNameKey, name);
    await prefs.setString(activeEmailKey, email);
    await prefs.setString(activePasswordKey, password);
    List<String>? n = prefs.getStringList(namesKey);
    List<String>? e = prefs.getStringList(emailsKey);
    List<String>? p = prefs.getStringList(passwordsKey);
    print("In second section");
    print(n);
    print(e);
    print(p);
  }
}
