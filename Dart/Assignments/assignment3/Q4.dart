void main() {
  // ? and ?? is used after the condition
  // examlple for ? --> condition?statement1:statement2 (it is a simple version of if else)
  // example for ?? --> var2 = var1??statement
  //      if var1 is null, statement is assigned to var2 otherwise var1 is assigned
  // for ?
  int a = 10;
  String b = (a == 10) ? "statement is right" : "statement is wrong";
  print(b);

  // for ??
  int? c;
  var d = c ?? "c has null value";
  print(d);
  c = 4;
  var e = c ?? "c has not null value";
  print(e);
}
