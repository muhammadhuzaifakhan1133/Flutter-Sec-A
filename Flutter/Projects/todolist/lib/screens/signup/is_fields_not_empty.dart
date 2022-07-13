import 'package:todolist/screens/signup/signup_text_fields_errors.dart';

bool isFieldNotEmpty(
    {required setState,
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
    required SignUpTextFieldErrors errors}) {
  String error = "This field is required";
  bool fieldsNotEmpty = true;
  if (name.isEmpty) {
    setState(() {
      errors.nameError = error;
    });
    fieldsNotEmpty = false;
  }
  if (email.isEmpty) {
    setState(() {
      errors.emailError = error;
    });
    fieldsNotEmpty = false;
  }
  if (password.isEmpty) {
    setState(() {
      errors.passwordError = error;
    });
    fieldsNotEmpty = false;
  }
  if (confirmPassword.isEmpty) {
    setState(() {
      errors.confirmPasswordError = error;
    });
    fieldsNotEmpty = false;
  }
  if (fieldsNotEmpty) {
    return true;
  } else {
    return false;
  }
}
