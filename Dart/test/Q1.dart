import "dart:io";

void main() {
  num number = int.parse(stdin.readLineSync()!);
  if (number < 0) {
    print("Factorial of negative number is doen't exist");
  } else {
    double fact = factorial(number);
    print("Factorial of $number is $fact");
  }
}

double factorial(num number) {
  if (number == 0) {
    return 1;
  }
  if (number == 1) {
    return 1;
  }
  return number * factorial(number - 1);
}
