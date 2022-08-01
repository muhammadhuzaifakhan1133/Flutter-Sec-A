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

  List<String> breadthList = prefs.getStringList("breadth") ?? [];
  List<String> waistList = prefs.getStringList("waist") ?? [];
  List<String> lengthList = prefs.getStringList("length") ?? [];
  List<String> colorList = prefs.getStringList("color") ?? [];
  List<String> materialList = prefs.getStringList("material") ?? [];
  List<String> priceList = prefs.getStringList("price") ?? [];
  List<String> qtyList = prefs.getStringList("qty") ?? [];
  List<String> productNameList = prefs.getStringList("productName") ?? [];
  List<String> productIDList = prefs.getStringList("productID") ?? [];
  List<String> productDesignerList =
      prefs.getStringList("productDesigner") ?? [];
  List<String> productImageList = prefs.getStringList("productImage") ?? [];
  breadthList.add("$breadth");
  productIDList.add(productID);
  waistList.add("$waist");
  lengthList.add("$length");
  colorList.add(color);
  materialList.add(material);
  qtyList.add("$qty");
  productNameList.add(productName);
  productDesignerList.add(productDesigner);
  productImageList.add(productImage);
  priceList.add("$price");
  prefs.setStringList("breadth", breadthList);
  prefs.setStringList("waist", waistList);
  prefs.setStringList("length", lengthList);
  prefs.setStringList("color", colorList);
  prefs.setStringList("material", materialList);
  prefs.setStringList("qty", qtyList);
  prefs.setStringList("productName", productNameList);
  prefs.setStringList("productDesigner", productDesignerList);
  prefs.setStringList("productImage", productImageList);
  prefs.setStringList("price", priceList);
  prefs.setStringList("productID", productIDList);
}

Future<double> getTotalPriceOfBagProducts() async {
  final SharedPreferences prefs = await _prefs;
  List<String> priceList = prefs.getStringList("price") ?? [];
  List<String> qtyList = prefs.getStringList("qty") ?? [];
  double totalPrice = 0;
  for (var i = 0; i < priceList.length; i++) {
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
  final SharedPreferences prefs = await _prefs;
  List<String> breadthList = prefs.getStringList("breadth")!;
  List<String> waistList = prefs.getStringList("waist")!;
  List<String> lengthList = prefs.getStringList("length")!;
  List<String> colorList = prefs.getStringList("color")!;
  List<String> materialList = prefs.getStringList("material")!;
  List<String> qtyList = prefs.getStringList("qty")!;
  breadthList[index] = "$breadth";
  waistList[index] = "$waist";
  lengthList[index] = "$length";
  colorList[index] = color;
  materialList[index] = material;
  qtyList[index] = "$qty";
  List<String> keys = [
    "breadth",
    "waist",
    "length",
    "color",
    "material",
    "qty"
  ];
  List<List<String>> values = [
    breadthList,
    waistList,
    lengthList,
    colorList,
    materialList,
    qtyList
  ];
  for (var i = 0; i < keys.length; i++) {
    prefs.setStringList(keys[i], values[i]);
  }
}

Future<void> removeProductFromBag({required int index}) async {
  final SharedPreferences prefs = await _prefs;
  List<String> breadthList = prefs.getStringList("breadth")!;
  List<String> waistList = prefs.getStringList("waist")!;
  List<String> lengthList = prefs.getStringList("length")!;
  List<String> colorList = prefs.getStringList("color")!;
  List<String> materialList = prefs.getStringList("material")!;
  List<String> qtyList = prefs.getStringList("qty")!;
  breadthList.removeAt(index);
  waistList.removeAt(index);
  lengthList.removeAt(index);
  colorList.removeAt(index);
  materialList.removeAt(index);
  qtyList.removeAt(index);
  List<String> keys = [
    "breadth",
    "waist",
    "length",
    "color",
    "material",
    "qty"
  ];
  List<List<String>> values = [
    breadthList,
    waistList,
    lengthList,
    colorList,
    materialList,
    qtyList
  ];
  for (var i = 0; i < keys.length; i++) {
    prefs.setStringList(keys[i], values[i]);
  }
}
