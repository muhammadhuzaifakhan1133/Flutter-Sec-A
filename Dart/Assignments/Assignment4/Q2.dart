void main() {
  List<int> a = [1, 4, 9, 16, 25, 36, 49, 64, 81, 100];
  List<int> even = [];
  for (var number in a) {
    if (number.isEven) {
      even.add(number);
    }
  }
  print(even);
}
