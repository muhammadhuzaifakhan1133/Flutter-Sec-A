import 'dart:convert';
import 'package:helloapi/model/user_model.dart';
import 'package:http/http.dart' as http;

String url = "https://maaz-api.tga-edu.com/api/users";

Future<UserModel> getUsers() async {
  http.Response response;
  try {
    response = await http.get(Uri.parse(url));
  } catch (e) {
    throw "Internet Problem";
  }
  var data = jsonDecode(response.body);
  return UserModel.fromJson(data);
}

Future<void> postData(Data data) async {
  http.Response response = await http.post(
    Uri.parse(url),
    headers: {"Content-type": "application/json", "Accept": "application/json"},
    body: jsonEncode(data.toJson()),
  );
}

Future<void> updateData({required Data data, required int id}) async {
  var url = Uri.parse("https://maaz-api.tga-edu.com/api/users/${id}");
  await http.put(url,
      headers: {
        "Content-type": "application/json",
      },
      body: jsonEncode(data.toJson()));
}

deleteData({required int id}) async {
  Uri uri = Uri.parse("https://maaz-api.tga-edu.com/api/users/${id}");
  await http.delete(
    uri,
    headers: {
      "Content-type": "application/json",
    },
  );
}
