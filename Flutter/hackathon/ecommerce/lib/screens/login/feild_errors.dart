class LoginFieldErrors {
  String? emailError;
  String? passwordError;

  void closeAllErrors() {
    emailError = passwordError = null;
  }
}
