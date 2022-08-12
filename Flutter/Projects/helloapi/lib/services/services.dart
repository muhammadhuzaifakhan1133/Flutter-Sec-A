import 'dart:convert';
import 'package:helloapi/model/user_model.dart';
import 'package:http/http.dart' as http;

String url = "https://maaz-api.tga-edu.com/api/users";

Future<UserModel> getUsers() async {
  http.Response response = await http.get(Uri.parse(url));
  var data = jsonDecode(response.body);
  print(data);
  return UserModel.fromJson(data);
}

Future<void> postData(Map<String, dynamic> data) async {
  http.Response response = await http.post(
    Uri.parse(url),
    headers: {"Content-type": "application/json", "Accept": "application/json"},
    body: jsonEncode(data),
  );
}

Future<void> updateData(
    {required Map<String, dynamic> data, required int id}) async {
  url += "/${id}";
  print(url);
  return;
  http.Response response = await http.put(Uri.parse(url),
      headers: {
        "Content-type": "application/json",
        "Accept": "application/json"
      },
      body: jsonEncode(data));
}

Future<void> deleteData(int id) async {
  url += "/${id}";
  http.Response response = await http.delete(Uri.parse(url));
}
