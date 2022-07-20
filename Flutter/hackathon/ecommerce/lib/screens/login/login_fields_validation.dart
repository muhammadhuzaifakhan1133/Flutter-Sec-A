import 'package:ecommerce/functions/is_email_valid.dart';
import 'package:ecommerce/screens/login/feild_errors.dart';
import 'package:ecommerce/screens/login/is_field_not_empty.dart';

loginFieldsValidation(
    {required setState,
    required String email,
    required String password,
    required LoginFieldErrors errors}) {
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
