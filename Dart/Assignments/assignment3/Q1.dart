// (1)What are the various types of operators in dart? Explain with Examples.
void main() {
  // The operators are special symbols that are used to carry out certain operations on the operands. The Dart has numerous built-in operators which can be used to carry out different functions
  // The following are the various types of operators in Dart:
// 1. Arithmetic Operators
// 2. Relational Operators
// 3. Type Test Operators
// 4. Bitwise Operators
// 5. Assignment Operators
// 6. Logical Operators
// 7. Conditional Operator
// 8. Cascade Notation Operator

//                       Arithmetic Operators
// +, -, -expr, *, /, ~/, %
  int a = 2;
  int b = 3;

// Adding two operands
  int c = a + b;
  print("Sum of a and b is $c");

// Subtracting two operands
  int d = a - b;
  print("The difference between a and b is $d");

// Reverse the sign of expression
  int e = -d;
  print("The negation of difference between a and b is $e");

// Multiplying two operands
  int f = a * b;
  print("The product of a and b is $f");

// Dividing two operands
  num g = b / a;
  print("The quotient of a and b is $g");

// Dividing two operands but result in integer type
  int h = b ~/ a;
  print("The quotient of a and b is $h");

// Get Remainder of Division of two operands
  int i = b % a;
  print("Remainder of division of a and b is $i");

  //                          Relational Operators
  // >, <, >=, <=, ==, !=

  // Greater between a and b
  bool j = a > b;
  print("a is greater than b is $j");

  // Smaller between a and b
  bool k = a < b;
  print("a is smaller than b is $k");

  // Greater than or equal to between a and b
  bool l = a >= b;
  print("a is greater than or equal to b is $l");

  // Less than or equal to between a and b
  bool m = a <= b;
  print("a is smaller than or equal to b is $m");

  // Equality between a and b
  bool n = a == b;
  print("a is equal to b is $n");

  // unequality between a and b
  bool o = a != b;
  print("a is not equal to b is $o");

  //                        Test Type Operator
  // is, is! (is not)
  String p = "abc";
  double q = 1.2;

  // Using is to compare
  print(p is String);
  print(q is! int);

  //                            Bitwise Operator
  // &, |, ^, ~, <<, >>,
  a = 5;
  b = 7;
// Performing Bitwise AND on a and b
  var r = a & b;
  print(r);

// Performing Bitwise OR on a and b
  var s = a | b;
  print(s);

// Performing Bitwise XOR on a and b
  var t = a ^ b;
  print(t);

// Performing Bitwise NOT on a
  var u = ~a;
  print(u);

// Performing left shift on a
  var v = a << b;
  print(v);

// Performing right shift on a
  var w = a >> b;
  print(w);

//                                    Assignment Operator
// ==, ??=

//  Assigning a value to variable c
  var x = a * b;
  print(x);

// Assigning only if vaiable before = is null
  var y;
  y ??= a + b;
  print(y);
  y ??= a - b;
  print(y);

  //                                    Logical Operator
  // &&, ||, !

  // using && (and operator), give true only if both operand true
  bool z = a > 10 && b < 10;
  print(z);

  // using || (or operator), give true if even one of them is true
  bool aa = a > 10 || b < 10;
  print(aa);

// Using ! (Not operaotr) to reverse the boolean result
  bool ab = !(a > 10);
  print(ab);

//                                   Conditional Operator
// condition?exp1:exp2, condition??exp1

// using condtion?exp1:exp2, It is a simple version of if-else statement. If the condition is true than exp1 is executed else expe is executed.
  var ac = (a < 10) ? "statement is correct" : "statement is wrong";
  print(ac);

// using condtion??exp1
  int? ad;
  var ae = ad ?? "ad has null value";
  print(ae);

  ad = 10;
  ae = ad ?? "ad has null value";
  print(ae);

  //                                    Cascade Notaion Operator
  // .. (It is used to perform multiple methods on the same object.)
//  Creating objects of class CGF
  CGF af = new CGF();
  CGF ag = new CGF();

// Wihtout using cascade notaiton
  af.set(1, 2);
  af.add();

// with using cascade notation
  ag
    ..set(3, 4)
    ..add();
}

class CGF {
  var a;
  var b;

  void set(x, y) {
    this.a = x;
    this.b = y;
  }

  void add() {
    var z = this.a + this.b;
    print(z);
  }
}
