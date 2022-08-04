import 'package:ecommerce/constants/values.dart';
import 'package:shared_preferences/shared_preferences.dart';

final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

saveAsActiveUser(String name) async {
  final SharedPreferences prefs = await _prefs;
  prefs.setString("activeName", name);
}

Future<void> removeActiveUser() async {
  final SharedPreferences prefs = await _prefs;
  prefs.remove("activeName");
}

Future<void> addProductToBag(
    {required String productName,
    required String productDesigner,
    required String productImage,
    required String productID,
    required double price,
    required int breadth,
    required int waist,
    required int length,
    required String color,
    required String material,
    required int qty}) async {
  final SharedPreferences prefs = await _prefs;
  List<String> newProductValues = [
    "$breadth",
    "$waist",
    "$length",
    color,
    material,
    "$price",
    "$qty",
    productID,
    productName,
    productDesigner,
    productImage
  ];
  ;
  List<List<String>> values = [];
  for (var i = 0; i < bagProductKeys.length; i++) {
    values.add(prefs.getStringList(bagProductKeys[i]) ?? []);
    values[i].add(newProductValues[i]);
    prefs.setStringList(bagProductKeys[i], values[i]);
  }
}

Future<double> getTotalPriceOfBagProducts() async {
  final SharedPreferences prefs = await _prefs;
  List<String> priceList = prefs.getStringList("price") ?? [];
  List<String> qtyList = prefs.getStringList("qty") ?? [];
  double totalPrice = 0;
  for (var i = 0; i < qtyList.length; i++) {
    double total = double.parse(priceList[i]) * int.parse(qtyList[i]);
    totalPrice += total;
  }
  return totalPrice;
}

Future<Map<String, List<String>>> getBagProducts() async {
  final SharedPreferences prefs = await _prefs;
  Map<String, List<String>> data = {};
  for (var i = 0; i < bagProductKeys.length; i++) {
    data[bagProductKeys[i]] = prefs.getStringList(bagProductKeys[i]) ?? [];
  }
  return data;
}

Future<void> removeBagProducts() async {
  final SharedPreferences prefs = await _prefs;
  for (var i = 0; i < bagProductKeys.length; i++) {
    prefs.remove(bagProductKeys[i]);
  }
}

Future<void> updateBagProduct(
    {required int index,
    required int breadth,
    required int waist,
    required int length,
    required String color,
    required String material,
    required int qty}) async {
  List<String> keys = [
    "breadth",
    "waist",
    "length",
    "color",
    "material",
    "qty"
  ];
  final SharedPreferences prefs = await _prefs;
  List<List<String>> values = [];
  List<String> updatedProductValues = [
    "$breadth",
    "$waist",
    "$length",
    color,
    material,
    "$qty"
  ];
  for (var i = 0; i < keys.length; i++) {
    values.add(prefs.getStringList(keys[i])!);
    values[i][index] = updatedProductValues[i];
    prefs.setStringList(keys[i], values[i]);
  }
}

Future<void> removeProductFromBag({required int index}) async {
  final SharedPreferences prefs = await _prefs;
  List<List<String>> values = [];
  for (var i = 0; i < bagProductKeys.length; i++) {
    values.add(prefs.getStringList(bagProductKeys[i])!);
    values[i].removeAt(index);
    prefs.setStringList(bagProductKeys[i], values[i]);
  }
}
