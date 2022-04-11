void main() {
  Student abc = Student("Huzaifa");
  print(abc.name);

  Student obj = Student("Rafay");
  obj.getName();
  obj.setGrade(70.8);
  print(obj.grade);

  Dog dog1 = Dog("John", "Brown");
  dog1.dogData();

  obj.dog?.dogData();
  obj.setDog(dog1);
  obj.dog?.setowner(obj);
  obj.dog?.dogData();
}

class Student {
  String name = "";
  String grade = "";
  Dog? dog;

  Student(this.name);

  setDog(Dog d) {
    this.dog = d;
  }

  getName() {
    print(name);
  }

  setGrade(double per) {
    grade = getGrade(per);
  }

  String getGrade(double per) => per > 80
      ? "A+"
      : per > 70
          ? "A"
          : per > 60
              ? "B"
              : per > 50
                  ? "C"
                  : "Fail";
}

class Dog {
  String name = "";
  String color = "";
  Student? owner;

  Dog(this.name, this.color);

  dogData() {
    print(
        "Bark! My name is ${this.name} and my color is ${this.color} and my owner name is ${owner?.name}");
  }

  setowner(Student std) {
    this.owner = std;
  }
}
