import 'dart:io';

void main() {
  print("Enter number for which you want to find  pair for it sum :");
  var res = int.parse(stdin.readLineSync()!);
  List<int> numbers = [for (int i = 0; i <= 100; i++) i];
  for (var i in numbers) {
    for (var j in numbers) {
      if (i + j == res) {
        print("($i, $j)");
      }
    }
  }
}
