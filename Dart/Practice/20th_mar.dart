void main() {
  List<int> nums = [33, 2, 3, 4, 11, 5, 6, -4, 7, 8, 9, 10];
  int smallest = nums[0];
  for (int n in nums) {
    if (smallest > n) {
      smallest = n;
    }
  }
  print(smallest);
}
