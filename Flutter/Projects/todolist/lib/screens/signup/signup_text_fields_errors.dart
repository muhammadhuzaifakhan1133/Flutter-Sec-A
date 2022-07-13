class SignUpTextFieldErrors {
  String? nameError;
  String? emailError;
  String? passwordError;
  String? confirmPasswordError;

  closeAllErrors() {
    nameError = emailError = passwordError = confirmPasswordError = null;
  }
}
