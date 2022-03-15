void main() {
  List<String> names = [
    "Ahmed",
    "Bilal",
    "Muhammad",
    "Owais",
    "Muhammad",
    "Ali",
    "Ahmed"
  ];
  names = List.of(names.toSet());
  print(names);
}
