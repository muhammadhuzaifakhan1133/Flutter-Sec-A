void main() {
  var a = abc();
  print("Call function abc $a");
  var b = bcd();
  print("Call function bcd $b");
  student("Huzaifa", "342348909345");
  student("Owais", "234149989734");
  student("AmmaD", "2342340989", "B");
}

abc() {
  print("Inside abc function : object");
  return "Huzaifa";
}

bcd() {
  print("Inside bcd function : object");
}

student(name, phone, [sec = "A"]) {
  print(name);
  print(phone);
  print(sec);
}
