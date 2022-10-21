import 'dart:convert';

import 'package:education/models/category/category_model.dart';
import 'package:http/http.dart' as http;

Future<CategoryModel> getServices() async {
  String url =
      "https://phplaravel-704365-2879244.cloudwaysapps.com/api/jawan_pakistan";
  http.Response response = await http.get(Uri.parse(url));
  var data = jsonDecode(response.body);
  return CategoryModel.fromJson(data);
}
