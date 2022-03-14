void main() {
  List<int> nums = [1, 2, 7, 4, 5];
  Type type = nums.runtimeType; // 1 for list : Give type
  print(type);
  print(nums.contains(7)); // 2 for list : Give true if list contain 7
  print(nums.indexOf(4)); // 3 for list : Give index of given element
  String nums_Str = nums
      .toString(); // 4 for list ;Covert a list to whole string means string[0] is '['
  print(nums_Str[0]);
  print(nums.skip(
      2)); // 5 for list ;skip starting element of count i.e. 2 and give tuple not list

  String name = "Huzaifa";
  print(name
      .codeUnitAt(0)); // 1 for String : GIve code of character at given index
  print(name.endsWith(
      "fa")); // 2 for string : give true if string ends with given substirng otherwise false
  String name2 = name.replaceAll("H",
      "M.H"); // 3 for string : replace the old sub string with new substring
  print(name2);
  List<String> full_name =
      name2.split("."); //4 for string : split string at given character
  print(full_name);
  print(name2.toUpperCase()); // 5 for string : convert string to upper case
}
