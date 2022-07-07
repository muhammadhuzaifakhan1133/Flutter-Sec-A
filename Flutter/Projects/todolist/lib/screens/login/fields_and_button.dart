import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todolist/screens/home/home.dart';
import 'package:todolist/widgets/button.dart';
import 'package:todolist/widgets/password_suffix_icon.dart';
import 'package:todolist/widgets/text_field.dart';

class FieldsAndButton extends StatefulWidget {
  const FieldsAndButton({Key? key}) : super(key: key);

  @override
  State<FieldsAndButton> createState() => _FieldsAndButtonState();
}

class _FieldsAndButtonState extends State<FieldsAndButton> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  String? emailError;
  String? passwordError;
  String? name;
  bool obscureText = true;
  dynamic data;
  Future<void> getUserName({required String doucmentID}) async {
    DocumentReference user =
        FirebaseFirestore.instance.collection("users").doc(doucmentID);
    DocumentSnapshot data = await user.get();
    Map<String, dynamic> values = data.data() as Map<String, dynamic>;
    name = values["name"];
  }

  Future<int> ensureFieldIsNotEmpty() async {
    String error = "This field is required";
    if (emailController.text.isEmpty) {
      setState(() {
        emailError = error;
      });
      return 0;
    }
    if (passController.text.isEmpty) {
      setState(() {
        passwordError = error;
      });
      return 0;
    }
    return 1;
  }

  Future<int> logIn() async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passController.text);
      return 1;
    } on FirebaseAuthException catch (e) {
      print("hello");
      if (e.code == 'user-not-found') {
        setState(() {
          emailError = 'No user found for that email.';
        });
      } else if (e.code == 'wrong-password') {
        setState(() {
          passwordError = 'Wrong password provided for that user.';
        });
      }
      return 0;
    }
  }

  saveAsActiveUser() async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString("activeEmail", emailController.text);
    prefs.setString("activeName", name!);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(height: size.height * 0.04),
        textFieldWidget(
            size: size,
            errorText: emailError,
            controller: emailController,
            labelText: "Enter your email",
            keyboardtype: TextInputType.emailAddress),
        textFieldWidget(
          size: size,
          errorText: passwordError,
          obscureText: obscureText,
          controller: passController,
          labelText: "Enter your password",
          keyboardtype: TextInputType.visiblePassword,
          suffixIcon: suffixIcon(obscureText),
          onPressedSuffixIcon: () {
            setState(() {
              obscureText = !obscureText;
            });
          },
        ),
        SizedBox(height: size.height * 0.03),
        buttonWidget(
            size: size,
            text: "Log in",
            onpressed: () async {
              setState(() {
                emailError = passwordError = null;
              });
              int fieldValidated = await ensureFieldIsNotEmpty();
              if (fieldValidated == 1) {
                int validUser = await logIn();
                if (validUser == 1) {
                  await getUserName(doucmentID: emailController.text);
                  await saveAsActiveUser();
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Home(name: name, email: emailController.text)),
                      (route) => false);
                }
              }
            })
      ],
    );
  }
}
