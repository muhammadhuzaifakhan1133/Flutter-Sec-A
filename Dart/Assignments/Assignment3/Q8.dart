void main() {
  List<String> stds = ["Huzaifa", "Anus", "Sheraz"];
  List<int> marks = [480, 471, 490];
  for (var i = 0; i < stds.length; i++) {
    var per = (marks[i] / 500) * 100;
    print("Percentage of ${stds[i]} is ${num.parse(per.toStringAsFixed(2))}");
  }
}
