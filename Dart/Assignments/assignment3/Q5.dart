void main() {
  // there are 5 data types in dart
  // 1. Number
  //   a. int
  //   b. double
  //   c. num
  // 2. String
  // 3. Bool
  // 4. List
  // 5. Map

  //  Number: int is used for interger
  //          double is used for float
  //          num is used for both interger and float

  int a = 10;
  double b = 4.6;
  num c = 11;
  num d = 5.5;
  print("$a,$b,$c,$d");

  // String is used for all characters enclosed in single or double qoutes
  String name = "Huzaifa";
  print(name);

  // List is used for creating list in dart
  List<int> roll_no = [1, 2, 3, 4, 5, 6];

  // Map is used for creating dictionary in dart
  Map<String, dynamic> student = {
    "Name": "Huzaifa",
    "Age": 19,
    "Course": "dart"
  };
  print(student);
}
