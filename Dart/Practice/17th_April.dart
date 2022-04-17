void main() {
  // Human human1 = Human("Huzaifa", 19, "23423423");
  // print(human1.age);
  // human1.eat();
  Male men1 = Male();
  men1.programming();
  Mobile mob1 = Mobile("Infinix");
  Mobile tab1 = Mobile.Tab("Samsung");
  print(mob1);
  print(tab1);
  mob1.poweron();
  tab1.poweron();
}

class Human {
  String name = "Huzaifa";
  int age = 19;
  String cnic = "2423423f342sd";

  eat() {
    print("${this.name} is eating");
  }

  sleep() {
    print("${this.name} is sleeping");
  }

  drink() {
    print("${this.name} is drinking");
  }
}

class Male extends Human {
  programming() {
    print("${this.name} learn how to code");
  }
}

class Mobile {
  String name;
  Mobile(this.name);
  Mobile.Tab(this.name);
  poweron() {
    print("${this.name} is power on");
  }
}
