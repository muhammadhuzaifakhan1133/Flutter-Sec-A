import 'dart:io';

void main() {
  print("Enter a character to check weather it is vowel or not :");
  var char = stdin.readLineSync();
  List<String> vowels = ["a", "e", "i", "o", "u"];
  if (vowels.contains(char)) {
    print("$char is a vowel");
  } else {
    print("$char is not a vowel");
  }
}
