void main() {
  var numbers = [7, 9, 5, 11, 7, 4, 12, 6, 2, 11];
  int min_dist = 0;
  int dist = 0;
  for (int i = 0; i < numbers.length; i++) {
    if (i == 0) {
      dist = numbers[0] - numbers[1];
    } else {
      dist = numbers[i] - numbers[0];
    }
    for (int j = 0; j < numbers.length; j++) {
      if (j != i) {
        if (numbers[i] - numbers[j] < dist) {
          dist = numbers[i] - numbers[j];
        }
      }
    }
    if (i == 0) {
      min_dist = dist;
    } else {
      if (dist < min_dist) {
        min_dist = dist;
      }
    }
  }
  print(min_dist);
}
