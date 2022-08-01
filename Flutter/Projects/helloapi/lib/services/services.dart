import 'dart:convert';
import 'package:helloapi/model/user_model.dart';
import 'package:http/http.dart' as http;

Future<List<User>> getUsers() async {
  List<User> userlist = [];
  String url = "https://jsonplaceholder.typicode.com/users";
  var response = await http.get(Uri.parse(url));
  var data = jsonDecode(response.body);
  for (var map in data) {
    userlist.add(User.fromJson(map));
  }
  return userlist;
}
