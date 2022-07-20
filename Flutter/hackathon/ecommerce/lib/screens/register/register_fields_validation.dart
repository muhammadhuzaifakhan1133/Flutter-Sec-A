import 'package:ecommerce/functions/is_email_valid.dart';
import 'package:ecommerce/screens/register/feild_errors.dart';
import 'package:ecommerce/screens/register/is_fields_not_empty.dart';

bool registerFieldsValidation(
    {required setState,
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
    required RegisterFieldErrors errors}) {
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
      errors.confrimPasswordError = "Password mismatch";
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
