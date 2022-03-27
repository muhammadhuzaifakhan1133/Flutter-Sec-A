void main() {
  for (int i = 1; i <= 4; i++) {
    String pattern = "";
    for (int j = 1; j <= i; j++) {
      pattern += i.toString();
    }
    print(pattern);
  }
}
