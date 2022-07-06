import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todolist/screens/home/home.dart';
import 'package:todolist/widgets/button.dart';
import 'package:todolist/widgets/text_field.dart';

class FieldsAndButtons extends StatefulWidget {
  const FieldsAndButtons({Key? key}) : super(key: key);

  @override
  State<FieldsAndButtons> createState() => _FieldsAndButtonsState();
}

class _FieldsAndButtonsState extends State<FieldsAndButtons> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
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

  IconData suffixIcon(bool obscure) {
    if (obscure) {
      return Icons.visibility;
    } else {
      return Icons.visibility_off;
    }
  }

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
      if (e.code == 'weak-password') {
        setState(() {
          passwordError = 'The password provided is too weak.';
        });
        return 0;
      } else if (e.code == 'email-already-in-use') {
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
    }
  }

  saveNameAndPassword() async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    await users
        .doc(emailController.text)
        .set({
          'name': nameController.text,
          'password': passwordController.text,
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  saveAsActiveUser() async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString("activeEmail", emailController.text);
    prefs.setString("activeName", nameController.text);
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
              nameError =
                  emailError = passwordError = confirmPasswordError = null;
              int fieldValidated = ensureFieldIsNotEmpty();
              if (fieldValidated == 1) {
                int valueValidated = await addUser();
                if (valueValidated == 1) {
                  await saveNameAndPassword();
                  await saveAsActiveUser();
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => Home(
                                name: nameController.text,
                                email: emailController.text,
                              )),
                      (route) => false);
                }
              }
            })
      ],
    );
  }
}
