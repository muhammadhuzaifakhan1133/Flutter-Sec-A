import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todolist/screens/home/home.dart';
import 'package:todolist/screens/signup/save_user_as_active.dart';
import 'package:todolist/screens/signup/save_user_name.dart';
import 'package:todolist/widgets/button.dart';
import 'package:todolist/widgets/is_email_valid.dart';
import 'package:todolist/widgets/loading_widget.dart';
import 'package:todolist/widgets/password_suffix_icon.dart';
import 'package:todolist/widgets/text_field.dart';

class FieldsAndButtons extends StatefulWidget {
  const FieldsAndButtons({Key? key}) : super(key: key);

  @override
  State<FieldsAndButtons> createState() => _FieldsAndButtonsState();
}

class _FieldsAndButtonsState extends State<FieldsAndButtons> {
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

  ensureFieldIsNotEmpty() {
    String emptyError = "This field is required";
    if (nameController.text.isEmpty) {
      setState(() {
        nameError = emptyError;
      });
      return 0;
    }
    if (emailController.text.isEmpty) {
      setState(() {
        emailError = emptyError;
      });
      return 0;
    }
    if (passwordController.text.isEmpty) {
      setState(() {
        passwordError = emptyError;
      });
      return 0;
    }
    if (confirmPasswordController.text != passwordController.text) {
      setState(() {
        confirmPasswordError = "Password mismatch";
      });
      return 0;
    }
    int emailValidated = isEmailValid(emailController.text);
    if (emailValidated == 0) {
      setState(() {
        emailError = "Please enter valid email";
      });
      return 0;
    }
    if (passwordController.text.length < 6) {
      setState(() {
        passwordError = "password length must be equal or greater than 6";
      });
      return 0;
    }
    return 1;
  }

  Future<dynamic> addUser() async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      return 1;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        setState(() {
          emailError = "The account already exists for that email.";
        });
        return 0;
      }
    } catch (e) {
      SnackBar snackBar = SnackBar(
        content: Text(e.toString()),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return 0;
    }
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
              setState(() {
                nameError =
                    emailError = passwordError = confirmPasswordError = null;
              });
              int fieldValidated = ensureFieldIsNotEmpty();
              if (fieldValidated == 1) {
                circleProgressDialog(context);
                int valueValidated = await addUser();
                if (valueValidated == 1) {
                  await saveName(emailController.text, nameController.text);
                  await saveAsActiveUser(
                      emailController.text, nameController.text);
                  Navigator.pop(context);
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => Home(
                                name: nameController.text,
                                email: emailController.text,
                              )),
                      (route) => false);
                } else {
                  Navigator.pop(context);
                }
              }
            })
      ],
    );
  }
}
