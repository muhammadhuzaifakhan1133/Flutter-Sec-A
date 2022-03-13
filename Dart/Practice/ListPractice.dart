void main() {
  List<num> number = [21, 13, 55, 61, 20];
  print(number.first);
  print(number.length);
  print(number.last);
  number.sort();
  print(number);
  print(List.of(number.reversed));
  print(number.isEmpty);
  print(number.isNotEmpty);
  number.add(33);
  print(number);
  number.addAll([22, 13, 45]);
  print(number);
  print(number.elementAt(0));
  number.replaceRange(6, 9, []);
  print(number);
  number.insert(3, 45);
  print(number);
  number.insertAll(2, [1, 2, 3]);
  print(number);
}
