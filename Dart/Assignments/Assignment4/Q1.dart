void main() {
  List<dynamic> _nameList = [
    "Bilal",
    "Bilal",
    "Bilal",
    "Owais",
    "Owais",
    "Owais"
  ];
  var unique = List.of(_nameList.toSet());
  print(unique);
}
