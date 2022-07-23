String convertToKMBUnits(int number) {
  String result = "";
  if (number <= 999) {
    result = number.toString();
  } else if (number < 1000000) {
    result = "${(number / 1000).toStringAsFixed(2)}K";
  } else if (number < 1000000000) {
    result = "${(number / 1000000).toStringAsFixed(2)}M";
  } else if (number >= 1000000000) {
    result = "${(number / 1000000000).toStringAsFixed(2)}B";
  }
  return result;
}
