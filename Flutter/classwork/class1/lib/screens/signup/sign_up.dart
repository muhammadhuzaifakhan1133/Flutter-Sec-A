import 'package:class1/screens/home/home.dart';
import 'package:class1/widgets/button.dart';
import 'package:class1/widgets/login_signup_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final _nameKey = GlobalKey<FormState>();
  final _emailKey = GlobalKey<FormState>();
  final _passwordKey = GlobalKey<FormState>();
  final _confirmPasswordKey = GlobalKey<FormState>();
  late List<String>? emails = [];
  bool isEmailAlreadyRegistered = false;
  bool _passwordObscureText = true;
  bool _confirmPasswordObscureText = true;
  String setPassword = '';
  String setEmail = '';
  String setName = '';

  Future<List<String>?> getOldEmail() async {
    final SharedPreferences prefs = await _prefs;
    final List<String>? emails = prefs.getStringList('emails');
    return emails;
  }

  Widget suffixIcon(obscureText) {
    if (obscureText) {
      return Icon(
        Icons.visibility,
        color: Colors.grey,
      );
    } else {
      return Icon(
        Icons.visibility_off,
        color: Colors.grey,
      );
    }
  }

  @override
  void initState() {
    super.initState();
    getOldEmail().then((value) => emails = value);
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
                Text("Sign Up",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Algerian",
                        fontSize: 26)),
                Image(
                  image: AssetImage("assets/images/signup.jpg"),
                ),
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
                          setName = name;
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
                          if (emails == null) {
                            setEmail = email;
                            return null;
                          } else if (emails!.contains(email)) {
                            return "Email is already registered";
                          } else {
                            setEmail = email;
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
                          setPassword = password;
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
                        if (password != setPassword) {
                          return "Confirm password does not match";
                        } else {
                          setPassword = password;
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
                    validation: true,
                    validation_keys: [
                      _nameKey,
                      _emailKey,
                      _passwordKey,
                      _confirmPasswordKey
                    ],
                    isSignup: true,
                    name: setName,
                    email: setEmail,
                    password: setPassword,
                    go_to: Home()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
