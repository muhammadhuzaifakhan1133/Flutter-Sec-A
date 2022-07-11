import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:todolist/functions/firebase.dart';
import 'package:todolist/screens/email_verify/email_verify.dart';
import 'package:todolist/functions/save_user_as_active.dart';
import 'package:todolist/widgets/button.dart';
import 'package:todolist/functions/is_email_valid.dart';
import 'package:todolist/widgets/loading_widget.dart';
import 'package:todolist/widgets/password_suffix_icon.dart';
import 'package:todolist/widgets/text_field.dart';

class FieldsAndButton extends StatefulWidget {
  const FieldsAndButton({Key? key}) : super(key: key);

  @override
  State<FieldsAndButton> createState() => _FieldsAndButtonState();
}

class _FieldsAndButtonState extends State<FieldsAndButton> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool obscureTextPassword = true;
  bool obscureTextConfirmPassword = true;
  String? emailError;
  String? nameError;
  String? passwordError;
  String? confirmPasswordError;

  bool isFieldNotEmpty() {
    String error = "This field is required";
    bool fieldsNotEmpty = true;
    if (nameController.text.isEmpty) {
      setState(() {
        nameError = error;
      });
      fieldsNotEmpty = false;
    }
    if (emailController.text.isEmpty) {
      setState(() {
        emailError = error;
      });
      fieldsNotEmpty = false;
    }
    if (passwordController.text.isEmpty) {
      setState(() {
        passwordError = error;
      });
      fieldsNotEmpty = false;
    }
    if (confirmPasswordController.text.isEmpty) {
      setState(() {
        confirmPasswordError = error;
      });
      fieldsNotEmpty = false;
    }
    if (fieldsNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  bool signupFieldsValidation() {
    bool validFields = isFieldNotEmpty();
    if (!validFields) {
      return false;
    }
    if (confirmPasswordController.text != passwordController.text) {
      setState(() {
        confirmPasswordError = "Password mismatch";
      });
      return false;
    }
    if (!isEmailValid(emailController.text)) {
      setState(() {
        emailError = "Please enter valid email";
      });
      return false;
    }
    if (passwordController.text.length < 6) {
      setState(() {
        passwordError = "password length must be equal or greater than 6";
      });
      return false;
    }
    return true;
  }

  Future<dynamic> addUser() async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        setState(() {
          emailError = "The account already exists for that email.";
        });
        return false;
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
      return false;
    }
  }

  signUp() async {
    Fluttertoast.cancel();
    setState(() {
      nameError = emailError = passwordError = confirmPasswordError = null;
    });
    bool validFields = signupFieldsValidation();
    if (!validFields) {
      return;
    }
    circleProgressDialog(context);
    if (!(await InternetConnectionChecker().hasConnection)) {
      Navigator.of(context, rootNavigator: true).pop();
      Fluttertoast.showToast(msg: "No Internet Connection");
    }
    bool isSignUpSuccess = await addUser();
    if (!isSignUpSuccess) {
      Navigator.of(context, rootNavigator: true).pop();
      return;
    }
    bool emailSent = await sendVerificationEmail(context);
    if (!emailSent) {
      Navigator.of(context, rootNavigator: true).pop();
      return;
    }
    await saveAsActiveUser(nameController.text);
    Navigator.of(context, rootNavigator: true).pop();
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
            builder: (context) => EmailVerification(name: nameController.text)),
        (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        textFieldWidget(
            size: size,
            errorText: nameError,
            controller: nameController,
            labelText: "Enter name",
            keyboardtype: TextInputType.name),
        textFieldWidget(
            size: size,
            errorText: emailError,
            controller: emailController,
            labelText: "Enter email",
            keyboardtype: TextInputType.emailAddress),
        textFieldWidget(
            size: size,
            errorText: passwordError,
            controller: passwordController,
            labelText: "Enter password",
            obscureText: obscureTextPassword,
            keyboardtype: TextInputType.visiblePassword,
            suffixIcon: suffixIcon(obscureTextPassword),
            onPressedSuffixIcon: () {
              setState(() {
                obscureTextPassword = !obscureTextPassword;
              });
            }),
        textFieldWidget(
            size: size,
            errorText: confirmPasswordError,
            controller: confirmPasswordController,
            labelText: "Enter confirm password",
            obscureText: obscureTextConfirmPassword,
            keyboardtype: TextInputType.visiblePassword,
            suffixIcon: suffixIcon(obscureTextConfirmPassword),
            onPressedSuffixIcon: () {
              setState(() {
                obscureTextConfirmPassword = !obscureTextConfirmPassword;
              });
            }),
        buttonWidget(
            size: size,
            text: "Sign up",
            onpressed: () async {
              await signUp();
            })
      ],
    );
  }
}
