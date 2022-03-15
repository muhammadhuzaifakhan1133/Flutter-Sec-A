import "dart:io";

void main() {
  print("Please enter a number");
  var a = stdin.readLineSync();
  if (a != null) {
    int number = int.parse(a);

    bool prime = true;
    for (var i = 2; i < number; i++) {
      if (number % i == 0) {
        prime = false;
        break;
      }
    }
    if (prime) {
      print("$number is a prime number");
    } else {
      print("$number is not a prime number");
    }
  }
}
