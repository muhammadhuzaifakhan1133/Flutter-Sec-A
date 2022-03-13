import 'dart:io';

void main() {
  var email = stdin.readLineSync();
  var password = stdin.readLineSync();
  if (email == "huzaifa@gmail.com" && password == '123') {
    print("login Successfully");
  } else {
    print("Login Faild");
    if (email != "huzaifa@gmail.com") {
      print("Invalid Email");
    }
    if (password != "123") {
      print("Invalid Password");
    }
  }
}
