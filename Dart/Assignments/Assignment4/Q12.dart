void main() {
  List<int> numbers = [for (int i = 1; i <= 100; i++) i];
  List<int> missing = [];
  for (var number in numbers) {
    if ((numbers.contains(number + 1) == false) && (numbers.last != number)) {
      missing.add(number + 1);
    }
  }
  print(missing);
}
