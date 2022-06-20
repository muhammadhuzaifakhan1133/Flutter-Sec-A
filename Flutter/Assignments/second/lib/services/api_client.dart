import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiClient {
  final Uri currencyURL = Uri.https("free.currconv.com", "/api/v7/currencies",
      {"apiKey": "842182b943b5e86b2970"});

  Future<List<String>> getCurrencies() async {
    http.Response res = await http.get(currencyURL);
    if (res.statusCode == 200) {
      var body = jsonDecode(res.body);
      var list = body["results"];
      List<String> currencies = (list.keys).toList();
      return currencies;
    } else {
      throw Exception("Failed to connect to api");
    }
  }

  Future<double> getRate(String? fromCountry, String? toCountry) async {
    final Uri rateUrl = Uri.https("free.currconv.com", "/api/v7/convert", {
      "apiKey": "842182b943b5e86b2970",
      "q": "${fromCountry}_${toCountry}",
      "compact": "ultra"
    });
    http.Response res = await http.get(rateUrl);
    if (res.statusCode == 200) {
      var body = jsonDecode(res.body);
      var rate = body["${fromCountry}_${toCountry}"];
      rate = rate / 1;
      return rate;
    } else {
      throw Exception("Failed to connect to api");
    }
  }
}
