import 'dart:io';

void main() {
  String JS = "123abc";
  print("Please enter your password :");
  var pass = stdin.readLineSync();
  if (JS == pass) {
    print("Correct!");
  } else {
    print("Incorrect!");
  }
}
