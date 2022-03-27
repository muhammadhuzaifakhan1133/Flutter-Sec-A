import 'dart:math';

void main() {
  List<int> numbers = [1, 3, 3, 7, 4, 3, 2, 3, 3];
  Map<int, int> freq = {};
  for (int i = 0; i < numbers.length; i++) {
    freq.putIfAbsent(numbers[i], () => 0);
  }
  for (int i in freq.keys) {
    freq.update(i, (value) => count(numbers, i));
  }
  var keys = freq.keys.toList();
  var values = freq.values.toList();
  var max1 = freq.values.reduce(max);
  for (int i = 0; i < keys.length; i++) {
    if (numbers[i] == max1) {
      print(keys.elementAt(i));
      break;
    }
  }
}

int count(List<int> alist, int number) {
  int ans = 0;
  for (int i in alist) {
    if (i == number) {
      ans += 1;
    }
  }
  return ans;
}
