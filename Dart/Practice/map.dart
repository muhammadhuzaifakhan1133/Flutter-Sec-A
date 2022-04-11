void main() {
  Map<int, String> fruit = {1: "Apple", 2: "Orange"};
  var val1 = fruit.putIfAbsent(2, () => "Mango");
  var val2 = fruit.putIfAbsent(4, () => "Cherry");
  print(val1);
  print(val2);
  print(fruit);
  var f1 = {1: "Apple", 2: "Orange"};
  var f2 = {3: "Banana"};
  var f3 = {4: "Mango"};
  Map<int, String> fruit2 = {};
  print(fruit2.isEmpty);
  fruit2
    ..addAll(f1)
    ..addAll(f2)
    ..addAll(f3);
  print(fruit2.isNotEmpty);
  Map<int, String> fruit3 = {...f1, ...f2, ...f3};
  print(fruit2);
  print(fruit3);
  var roman = ["I", "II", "V", "X", "L"];
  var number = [1, 2, 5, 10, 50];
  var data = Map.fromIterables(roman, number);
  print(data);
  print(data.containsKey(("II")));
  print(data.containsValue(6));
  data.forEach((key, value) {
    print("$key , $value");
  });
}
