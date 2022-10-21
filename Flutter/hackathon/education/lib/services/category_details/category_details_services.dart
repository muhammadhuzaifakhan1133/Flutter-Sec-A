import 'dart:convert';

import 'package:education/models/category_detail/category_details_model.dart';
import 'package:http/http.dart' as http;

Future<CategroyDetailsModel> getCategroyDetails(String course) async {
  String url =
      "https://phplaravel-704365-2879244.cloudwaysapps.com/api/jawan_pakistan/$course";
  http.Response response = await http.get(Uri.parse(url));
  var data = jsonDecode(response.body);
  return CategroyDetailsModel.fromJson(data);
}
