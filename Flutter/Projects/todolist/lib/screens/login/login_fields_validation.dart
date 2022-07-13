import 'package:todolist/functions/is_email_valid.dart';
import 'package:todolist/screens/login/is_field_not_empty.dart';
import 'package:todolist/screens/login/login_text_fields_errors.dart';

loginFieldsValidation(
    {required setState,
    required String email,
    required String password,
    required LogInTextFieldErrors errors}) {
  bool validFields = isFieldNotEmpty(
      setState: setState, email: email, password: password, errors: errors);
  if (!validFields) {
    return false;
  }
  if (!isEmailValid(email)) {
    setState(() {
      errors.emailError = "Please enter valid email";
    });
    return false;
  }
  return true;
}
