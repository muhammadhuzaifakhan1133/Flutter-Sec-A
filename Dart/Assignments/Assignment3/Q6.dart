void main() {
  List<int> number = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  List<int> multiple_7 = [7, 14, 21, 28, 35, 42, 49, 56, 63, 70];
  Map<int, int> table_7 = Map.fromIterables(number, multiple_7);
  print(table_7);
}
