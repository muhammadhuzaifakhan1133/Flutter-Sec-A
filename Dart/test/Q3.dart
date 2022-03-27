void main() {
  List<int> numbers = [1, 5, 9, 13, 17, 21, 25, 29, 33, 37];
  int total = 0;
  for (int i in numbers) {
    total += i;
  }
  print("Sum = $total");
}
