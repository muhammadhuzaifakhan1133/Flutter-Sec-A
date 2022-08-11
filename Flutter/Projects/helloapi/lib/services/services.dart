import 'dart:convert';
import 'package:helloapi/model/user_model.dart';
import 'package:http/http.dart' as http;

Future<UserModel> getUsers() async {
  String url = "https://maaz-api.tga-edu.com/api/users";
  var response = await http.get(Uri.parse(url));
  var data = jsonDecode(response.body);
  return UserModel.fromJson(data);
}
