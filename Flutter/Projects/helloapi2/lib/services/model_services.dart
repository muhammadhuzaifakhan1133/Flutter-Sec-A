import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:helloapi2/model/user_model.dart';

Future<void> postData() async {
  http.Response response = await http.post(
      Uri.parse('https://maaz-api.tga-edu.com/api/users'),
      headers: {
        "Content-type": "application/json",
        "Accept": "application/json"
      },
      body: jsonEncode(Data(
              name: "huzaifa memon",
              email: "huzaifa memon",
              username: "huzaifa memon")
          .toJson()));
}

Future<UserModel> getData() async {
  String url = "https://maaz-api.tga-edu.com/api/users";
  var response = await http.get(Uri.parse(url));
  var data = jsonDecode(response.body);
  return UserModel.fromJson(data);
}

Future<void> updateData({required Data user, required int id}) async {
  http.Response response = await http.put(
      Uri.parse('https://maaz-api.tga-edu.com/api/users/${id}'),
      headers: {
        "Content-type": "application/json",
        "Accept": "application/json"
      },
      body: jsonEncode(user.toJson()));
}

Future<void> deleteData({required int id}) async {
  http.Response response = await http.delete(
    Uri.parse('https://maaz-api.tga-edu.com/api/users/${id}'),
  );
}
