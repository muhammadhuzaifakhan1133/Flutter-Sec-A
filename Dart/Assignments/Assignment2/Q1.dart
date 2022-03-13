String get_grade(double per) {
  String? grade;
  if (per > 80) {
    grade = "A";
  } else if (per > 70) {
    grade = "B";
  } else if (per > 60) {
    grade = "C";
  } else if (per > 50) {
    grade = "D";
  } else {
    grade = "Fail";
  }
  return grade;
}

void main() {
  String name = "Muhammad Huzaifa Khan";
  String dob = "11th Mar 2003";
  String university = "UBIT";
  int phy = 91;
  int math = 90;
  int comp = 98;
  int eng = 81;
  int isl = 85;
  int total = phy + math + comp + eng + isl;
  double per = total / 500 * 100;
  num.parse(per.toStringAsFixed(2));
  var grade = get_grade(per);
  print("Name : $name");
  print("Date of Birth : $dob");
  print("University : $university\n");
  print("===========================================");
  print("SUBJECTS        MAX MARKS        OBT MARKS");
  print("Physics           100              $phy   ");
  print("Math              100              $math  ");
  print("Computer          100              $comp  ");
  print("English           100              $eng   ");
  print("Islamiat          100              $isl   \n");
  print("                    Total  ===>>   $total");
  print("                  Percentage =>>   $per  ");
  print("                    Grade  ===>>   $grade");
}
