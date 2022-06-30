import 'package:class1/constants/color_constants.dart';
import 'package:class1/functions/shared_preferences.dart';
import 'package:class1/screens/home/home.dart';
import 'package:class1/screens/signup/passwords_suffix_icon.dart';
import 'package:class1/widgets/button.dart';
import 'package:class1/widgets/login_signup_image_title.dart';
import 'package:class1/widgets/login_signup_textfield.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _nameKey = GlobalKey<FormState>();
  final _emailKey = GlobalKey<FormState>();
  final _passwordKey = GlobalKey<FormState>();
  final _confirmPasswordKey = GlobalKey<FormState>();
  List<String> emails = [];
  String newName = "";
  String newEmail = "";
  String newPassword = "";
  bool _passwordObscureText = true;
  bool _confirmPasswordObscureText = true;

  @override
  void initState() {
    super.initState();
    (() async {
      List<List<String>> userValues = await getUsers();
      emails = userValues[0];
    })();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double textFieldWidth = size.width * 0.85;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ImageAndTile(
                    title: "Sign Up",
                    image: "assets/images/signup.jpg",
                    imageTitle: "Filter task according to type and date",
                    gapBeforeWidget: 0,
                    gapAfterWidget: 0.030),
                Form(
                  key: _nameKey,
                  child: loginSignUpTextField(
                      width: textFieldWidth,
                      keyboardtype: TextInputType.name,
                      labelText: "Enter Name",
                      validator: (name) {
                        if ((name == null) || (name.isEmpty)) {
                          return "Please enter your name";
                        } else {
                          newName = name;
                          return null;
                        }
                      }),
                ),
                Form(
                  key: _emailKey,
                  child: loginSignUpTextField(
                      width: textFieldWidth,
                      validator: (email) {
                        if ((email == null) || (email.isEmpty)) {
                          return 'Please enter email';
                        } else {
                          if (emails.contains(email)) {
                            return "Email is already registered";
                          } else {
                            newEmail = email;
                            return null;
                          }
                        }
                      },
                      keyboardtype: TextInputType.emailAddress,
                      labelText: "Enter email"),
                ),
                Form(
                  key: _passwordKey,
                  child: loginSignUpTextField(
                      width: textFieldWidth,
                      labelText: "Enter password",
                      validator: (password) {
                        if ((password == null) || (password.isEmpty)) {
                          return "Please enter password";
                        }
                        if (password.length < 8) {
                          return "Minimum 8 characters required";
                        } else {
                          newPassword = password;
                          return null;
                        }
                      },
                      obscuretext: _passwordObscureText,
                      suffixIcon: suffixIcon(_passwordObscureText),
                      onPressedSuffixIcon: () {
                        setState(() {
                          _passwordObscureText = !_passwordObscureText;
                        });
                      }),
                ),
                Form(
                  key: _confirmPasswordKey,
                  child: loginSignUpTextField(
                      width: textFieldWidth,
                      labelText: "Enter confirm password",
                      validator: (password) {
                        if ((password == null) || (password.isEmpty)) {
                          return "Please enter confirm password";
                        }
                        if (password != newPassword) {
                          return "Confirm password does not match";
                        } else {
                          return null;
                        }
                      },
                      obscuretext: _confirmPasswordObscureText,
                      suffixIcon: suffixIcon(_confirmPasswordObscureText),
                      onPressedSuffixIcon: () {
                        setState(() {
                          _confirmPasswordObscureText =
                              !_confirmPasswordObscureText;
                        });
                      }),
                ),
                buttonWidget(
                    context: context,
                    text: "Sign Up",
                    width: size.width * 0.8,
                    text_size: 20.0,
                    isSignup: true,
                    onpressed: () async {
                      if ((_nameKey.currentState!.validate()) &&
                          (_emailKey.currentState!.validate()) &&
                          (_passwordKey.currentState!.validate()) &&
                          (_confirmPasswordKey.currentState!.validate())) {
                        await registerNewUser(
                            newEmail: newEmail,
                            newName: newName,
                            newPassword: newPassword);
                        Navigator.pushReplacement<void, void>(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                Home(userEmail: newEmail, userName: newName),
                          ),
                        );
                      }
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
