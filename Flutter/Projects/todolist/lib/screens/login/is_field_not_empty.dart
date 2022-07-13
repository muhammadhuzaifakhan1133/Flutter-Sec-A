import 'package:todolist/screens/login/login_text_fields_errors.dart';

bool isFieldNotEmpty(
    {required setState,
    required String email,
    required String password,
    required LogInTextFieldErrors errors}) {
  String error = "This field is required";
  bool fieldsNotEmpty = true;
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
  if (fieldsNotEmpty) {
    return true;
  } else {
    return false;
  }
}
