import 'package:class1/constants/color_constants.dart';
import 'package:class1/constants/local_storage_keys.dart';
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
  List<String> names = [];
  List<String> emails = [];
  List<String> passwords = [];
  String newName = "";
  String newEmail = "";
  String newPassword = "";
  bool _passwordObscureText = true;
  bool _confirmPasswordObscureText = true;

  Future<void> saveNewUser() async {
    final SharedPreferences prefs = await _prefs;
    print(newName);
    print(newEmail);
    print(newPassword);
    names.add(newName);
    emails.add(newEmail);
    passwords.add(newPassword);
    await prefs.setStringList(namesKey, names);
    await prefs.setStringList(emailsKey, emails);
    await prefs.setStringList(passwordsKey, passwords);
    await prefs.setString(activeNameKey, newName);
    await prefs.setString(activeEmailKey, newEmail);
    await prefs.setString(activePasswordKey, newPassword);
  }

  Future<void> getOldValues() async {
    final SharedPreferences prefs = await _prefs;
    final List<String>? oldNames = prefs.getStringList(namesKey);
    if (oldNames != null) {
      names = oldNames;
    }
    final List<String>? oldEmails = prefs.getStringList(emailsKey);
    if (oldEmails != null) {
      emails = oldEmails;
    }
    final List<String>? oldPasswords = prefs.getStringList(passwordsKey);
    if (oldPasswords != null) {
      passwords = oldPasswords;
    }
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
    getOldValues();
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
                        color: textColor,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Algerian",
                        fontSize: 26)),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image(
                      image: AssetImage("assets/images/signup.jpg"),
                    ),
                    Positioned(
                        bottom: 0,
                        child: Text("Filter task according to type and date",
                            style: TextStyle(
                              color: subTextColor,
                              fontSize: 18,
                            )))
                  ],
                ),
                SizedBox(
                  height: size.height * 0.030,
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
                        await saveNewUser();
                        Navigator.pushReplacement<void, void>(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) => Home(),
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
