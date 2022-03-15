void main() {
  num tc = 30;
  num tc_in_F = (tc * 9 / 5) + 32;
  print("${tc.toStringAsFixed(2)}oC is ${tc_in_F.toStringAsFixed(2)}oF");
  num tf = 86;
  num tf_in_C = (tf - 32) * 5 / 9;
  print("${tf.toStringAsFixed(2)}oF is ${tf_in_C.toStringAsFixed(2)}oC");
}
