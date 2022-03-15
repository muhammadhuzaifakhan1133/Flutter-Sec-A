import 'dart:io';

void main() {
  print("Enter first number :");
  var number1 = int.parse(stdin.readLineSync()!);
  print("Enter second number");
  var number2 = int.parse(stdin.readLineSync()!);
  print(
      "Which operation do you want. Press\n1 for addition\n2 for subtraction\n3 for multiplication\n4 for division\n5 for Modulo (remainder)");
  var choice = int.parse(stdin.readLineSync()!);
  if (choice == 1) {
    print("$number1 + $number2 = ${number1 + number2}");
  } else if (choice == 2) {
    print("$number1 - $number2 = ${number1 - number2}");
  } else if (choice == 3) {
    print("$number1 x $number2 = ${number1 * number2}");
  } else if (choice == 4) {
    print("$number1 / $number2 = ${number1 / number2}");
  } else if (choice == 5) {
    print("$number1 % $number2 = ${number1 % number2}");
  } else {
    print("Incorrect Choice");
  }
}
