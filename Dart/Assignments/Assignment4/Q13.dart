import 'dart:math';

void main() {
  List<int> numbers = [121, 12, 33, 14, 3];
  int largest = numbers.reduce(max);
  int smallest = numbers.reduce(min);
  print(largest);
  print(smallest);
}
