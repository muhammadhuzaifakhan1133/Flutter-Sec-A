import 'dart:convert';

import "package:http/http.dart" as http;
import 'package:todo/model/user_model.dart';

Future<List<UserModel>> getUser({required String queryName}) async {
  http.Response response;
  if (queryName == "") {
    response = await http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/users/"));
  } else {
    response = await http.get(Uri.parse(
        "https://jsonplaceholder.typicode.com/users?name=$queryName"));
  }
  dynamic jsonData = jsonDecode(response.body);
  List<UserModel> users = [];
  for (var userData in jsonData) {
    UserModel user = UserModel(
        id: userData['id'],
        name: userData['name'],
        username: userData['username'],
        email: userData['email'],
        phone: userData['phone']);
    users.add(user);
  }
  return users;
}
