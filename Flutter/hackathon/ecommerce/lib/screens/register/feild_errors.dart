class RegisterFieldErrors {
  String? nameError;
  String? emailError;
  String? passwordError;
  String? confrimPasswordError;

  void closeAllErrors() {
    nameError = emailError = passwordError = confrimPasswordError = null;
  }
}
