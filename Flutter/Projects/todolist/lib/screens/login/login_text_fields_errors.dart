class LogInTextFieldErrors {
  String? emailError;
  String? passwordError;

  closeAllErrors() {
    emailError = passwordError = null;
  }
}
