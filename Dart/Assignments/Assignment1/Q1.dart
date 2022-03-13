void main() {
    var name = "Muhammad Huzaifa Khan";
    var fname = "Muhammad Nawab Khan";
    var clas = "BSSE-1st Semester (UBIT)";
    num age = 19;
    print("Name        : $name");
    print("Father Name : $fname");
    print("Class       : $clas");
    print("Age         : $age");
    print("\n===========================================\n");
    num comp = 98;
    num phy = 90;
    num eng = 80;
    num math = 95;
    num isl = 85;
    num total = comp + phy + eng + math + isl;
    num per = total / 500 * 100;
    print("SUBJECT     |    MAX MARKS   |   OBT MARKS ");
    print("-------------------------------------------");
    print("Computer           100             $comp   ");
    print("Physics            100             $phy    ");
    print("Mathematics        100             $math   ");
    print("English            100             $eng    ");
    print("Islamiat           100             $isl    ");
    print("");
    print("                        Total    : $total  ");
    print("                      Percentage : ${num.parse(per.toStringAsFixed(2))}");
}