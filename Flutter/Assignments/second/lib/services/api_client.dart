import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiClient {
  final Uri currencyURL = Uri.https("free.currconv.com", "/api/v7/currencies",
      {"apiKey": "b243dc98b1068e2fb0a0"});

  Future<Map<String, List<String>>> getCurrenciesAndCountries() async {
    http.Response res = await http.get(currencyURL);
    if (res.statusCode == 200) {
      var body = jsonDecode(res.body);
      var list = body["results"];
      List<String> currencies = (list.keys).toList();
      List<String> countries = [];
      for (String c in currencies) {
        countries.add(list[c]["currencyName"]);
      }
      return {"currencies": currencies, "countries": countries};
    } else {
      throw Exception("Failed to connect to api");
    }
  }

  Future<double> getRate(String? fromCountry, String? toCountry) async {
    final Uri rateUrl = Uri.https("free.currconv.com", "/api/v7/convert", {
      "q": "${fromCountry}_${toCountry}",
      "compact": "ultra",
      "apiKey": "b243dc98b1068e2fb0a0",
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
