import 'package:class1/constants/local_storage_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

Future<List<String?>> getActiveUser() async {
  final SharedPreferences prefs = await _prefs;
  String? email = prefs.getString(activeEmailKey);
  String? name = prefs.getString(activeNameKey);
  String? password = prefs.getString(activePasswordKey);
  return [email, name, password];
}

Future<List<List<String>>> getUsers() async {
  final SharedPreferences prefs = await _prefs;
  List<String> emails = prefs.getStringList(emailsKey) ?? [];
  List<String> names = prefs.getStringList(namesKey) ?? [];
  List<String> passwords = prefs.getStringList(passwordsKey) ?? [];
  return [emails, names, passwords];
}

Future<void> saveActiveUser(String name, String email, String password) async {
  final SharedPreferences prefs = await _prefs;
  await prefs.setString(activeNameKey, name);
  await prefs.setString(activeEmailKey, email);
  await prefs.setString(activePasswordKey, password);
}

Future<void> registerNewUser(
    {required String newName,
    required String newEmail,
    required String newPassword}) async {
  final SharedPreferences prefs = await _prefs;
  Future<List<List<String>>> futureUserValues = getUsers();
  List<List<String>> userValues = await futureUserValues;
  List<String> emails = userValues[0];
  List<String> names = userValues[1];
  List<String> passwords = userValues[2];
  emails.add(newEmail);
  names.add(newName);
  passwords.add(newPassword);
  await prefs.setStringList(namesKey, names);
  await prefs.setStringList(emailsKey, emails);
  await prefs.setStringList(passwordsKey, passwords);
  await saveActiveUser(newName, newEmail, newPassword);
}

Future<void> saveListLocally(lists, email) async {
  final SharedPreferences prefs = await _prefs;
  await prefs.setStringList(email, lists);
}

Future<void> deleteList(email, listName) async {
  final SharedPreferences prefs = await _prefs;
  List<String>? oldLists = prefs.getStringList(email);
  oldLists!.remove(listName);
  await prefs.setStringList(email, oldLists);
  await prefs.remove(email + listName);
  await prefs.remove(email + listName + taskCompletionKey);
  await prefs.remove(email + listName + taskImportancyKey);
  await prefs.remove(email + listName + taskDateKey);
  await prefs.remove(email + listName + taskTimeKey);
}

Future<void> renameList(email, list_name, newName) async {
  final SharedPreferences prefs = await _prefs;
  List<String>? lists = prefs.getStringList(email);
  int listIndex = lists!.indexOf(list_name);
  lists[listIndex] = newName;
  await prefs.setStringList(email, lists);
}

Future<List<List<dynamic>>> getTaskList(email, listName) async {
  final SharedPreferences prefs = await _prefs;
  List<String> tasks = prefs.getStringList(email + listName) ?? [];
  List<String> Complete =
      prefs.getStringList(email + listName + taskCompletionKey) ?? [];
  List<String> important =
      prefs.getStringList(email + listName + taskImportancyKey) ?? [];
  List<String> date = prefs.getStringList(email + listName + taskDateKey) ?? [];
  List<String> time = prefs.getStringList(email + listName + taskTimeKey) ?? [];
  List<bool> isTaskComplete = Complete.map((e) => e == "true").toList();
  List<bool> isTaskImportant = important.map((e) => e == "true").toList();
  return [tasks, isTaskComplete, isTaskImportant, date, time];
}

saveTaskLocally(
    String email,
    String list_name,
    List<String> tasksTitle,
    List<bool> isTasksComplete,
    List<bool> isTasksImportant,
    List<String> tasksDate,
    List<String> tasksTime) async {
  final SharedPreferences prefs = await _prefs;
  prefs.setStringList(email + list_name, tasksTitle);
  List<String> isTasksCompleteString = [];
  isTasksComplete.forEach((item) => item == true
      ? isTasksCompleteString.add("ture")
      : isTasksCompleteString.add("false"));
  prefs.setStringList(
      email + list_name + taskCompletionKey, isTasksCompleteString);

  List<String> isTasksImportantString = [];
  isTasksImportant.forEach((item) => item == true
      ? isTasksImportantString.add("ture")
      : isTasksImportantString.add("false"));
  prefs.setStringList(
      email + list_name + taskImportancyKey, isTasksImportantString);

  prefs.setStringList(email + list_name + taskDateKey, tasksDate);
  prefs.setStringList(email + list_name + taskTimeKey, tasksTime);
}

saveTaskImportancyLocally(email, list_name, index) async {
  final SharedPreferences prefs = await _prefs;
  List<String> taskImportancy =
      (prefs.getStringList(email + list_name + taskImportancyKey))!;
  taskImportancy[index] = taskImportancy[index] == "true" ? "false" : "true";
  prefs.setStringList(email + list_name + taskImportancyKey, taskImportancy);
}

saveTaskCompletionLocally(email, list_name, index) async {
  final SharedPreferences prefs = await _prefs;
  List<String> taskCompletion =
      (prefs.getStringList(email + list_name + taskCompletionKey))!;
  taskCompletion[index] = taskCompletion[index] == "true" ? "false" : "true";
  prefs.setStringList(email + list_name + taskCompletionKey, taskCompletion);
}
