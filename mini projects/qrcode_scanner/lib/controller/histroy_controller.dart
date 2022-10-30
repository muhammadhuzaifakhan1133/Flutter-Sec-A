import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HistoryController extends GetxController {
  final box = GetStorage();
  RxList keys = [].obs;
  RxMap keysWithValues = {}.obs;
  String get today => DateTime.now().toString().split(" ")[0];
  final initiallyExpanded = true.obs;

  writeHistory(String text) async {
    List? tempListforValues = keysWithValues[today];
    List tempListforKeys = keys;
    if (keys.contains(today)) {
      print("hello");
      tempListforValues!.insert(0, text);
      await box.write(today, tempListforValues);
    } else {
      tempListforKeys.insert(0, today);
      tempListforValues = [text];
      await box.write(today, tempListforValues);
    }
    keysWithValues[today] = tempListforValues;
  }

  void readHistory() {
    keys.value = box.getKeys().map((e) => e).toList();
    for (String key in keys) {
      keysWithValues.putIfAbsent(key, () => []);
      keysWithValues[key] = box.read(key);
    }
    keysWithValues.putIfAbsent(today, () => []);
    print(keys);
    print(keysWithValues);
  }

  deleteHistory(String key, {int? index}) async {
    Map tempMap = keysWithValues;
    List tempKeys = keys;
    if ((index != null) && (tempMap[key].length != 1)) {
      tempMap[key].removeAt(index);
      box.write(key, tempMap[key]);
    } else {
      tempKeys.remove(key);
      await box.remove(key);
    }
    readHistory();
  }

  @override
  void onInit() {
    super.onInit();
    readHistory();
  }
}
