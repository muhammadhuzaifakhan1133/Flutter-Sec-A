import 'package:todolist/functions/is_email_valid.dart';
import 'package:todolist/screens/signup/is_fields_not_empty.dart';
import 'package:todolist/screens/signup/signup_text_fields_errors.dart';

bool signupFieldsValidation(
    {required setState,
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
    required SignUpTextFieldErrors errors}) {
  bool validFields = isFieldNotEmpty(
      setState: setState,
      name: name,
      email: email,
      password: password,
      confirmPassword: confirmPassword,
      errors: errors);
  if (!validFields) {
    return false;
  }
  if (confirmPassword != password) {
    setState(() {
      errors.confirmPasswordError = "Password mismatch";
    });
    return false;
  }
  if (!isEmailValid(email)) {
    setState(() {
      errors.emailError = "Please enter valid email";
    });
    return false;
  }
  if (password.length < 6) {
    setState(() {
      errors.passwordError = "password length must be equal or greater than 6";
    });
    return false;
  }
  return true;
}
