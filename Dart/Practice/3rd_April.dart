void main() {
  var a = abc();
  print("Call function abc $a");
  var b = bcd();
  print("Call function bcd $b");
  var c = efg();
  print(c);
  student("Huzaifa", "342348909345");
  student("Owais", "234149989734");
  student("AmmaD", "2342340989", "B");
  var numbers = [3, 2, 6, 9, 5];
  for (var i in numbers) {
    table(i);
  }
  test("name", age: 34, phone: "34234");
}

table(number) {
  print("Table of $number");
  print("===========");
  for (int i = 1; i <= 10; i++) {
    print("$number X $i = ${number * i}");
  }
  print("  X-X-X");
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

test(name, {age = 23, phone = "2234"}) {
  print(name);
  print(age);
  print(phone);
}

efg() => "value of efg function";
