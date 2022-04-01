void main() {
  getPercentage("Huzaifa", 85, 80, 90, 98, 91);
  getPercentage("Anas", 80, 80, 83, 90, 81);
  getPercentage("Rafay", 85, 75, 89, 86, 94);
  getPercentage("Wasay", 85, 81, 88, 92, 87);
}

getPercentage(String name, num eng, num urdu, num maths, num comp, num phy) {
  int total = 500;
  num obtain = eng + urdu + maths + comp + phy;
  num percent = (obtain * 100) / total;
  print("$name : ${percent.toStringAsFixed(2)}");
}
