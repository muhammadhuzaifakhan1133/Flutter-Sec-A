import 'dart:math';

void main() {
  List<int> numbers = [1, 3, 3, 7, 4, 3, 2, 3, 3];
  int major_count = 0;
  int major_number = 0;
  for (int i in numbers) {
    int count = 0;
    for (var j in numbers) {
      if (i == j) {
        count += 1;
      }
    }
    if (count > major_count) {
      major_count = count;
      major_number = i;
    }
  }
  print(major_number);
}
