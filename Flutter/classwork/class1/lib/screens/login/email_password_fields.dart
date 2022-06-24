import 'package:class1/constants/color_constants.dart';
import 'package:class1/constants/local_storage_keys.dart';
import 'package:class1/screens/home/home.dart';
import 'package:class1/widgets/button.dart';
import 'package:class1/widgets/login_signup_textfield.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EmailPasswordFields extends StatefulWidget {
  EmailPasswordFields({
    Key? key,
  }) : super(key: key);

  @override
  State<EmailPasswordFields> createState() => _EmailPasswordFieldsState();
}

class _EmailPasswordFieldsState extends State<EmailPasswordFields> {
  // final _formKey = GlobalKey<FormState>();
  final _emailKey = GlobalKey<FormState>();
  final _passwordKey = GlobalKey<FormState>();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  // bool isUserRegistered = true;
  List<String> names = [];
  List<String> emails = [];
  List<String> passwords = [];
  String correctPassword = '';
  String setEmail = '';
  String name = '';

  bool _obscuretext = true;
  Widget suffixIcon() {
    if (_obscuretext) {
      return Icon(
        Icons.visibility,
        color: suffixIconColor,
      );
    } else {
      return Icon(
        Icons.visibility_off,
        color: suffixIconColor,
      );
    }
  }

  Future<void> getOldValues() async {
    final SharedPreferences prefs = await _prefs;
    final List<String>? oldNames = prefs.getStringList(namesKey);
    if (oldNames != null) {
      names = oldNames;
    }
    print("names $names");
    final List<String>? oldEmails = prefs.getStringList(emailsKey);
    if (oldEmails != null) {
      emails = oldEmails;
    }
    print("emails $emails");
    final List<String>? oldPasswords = prefs.getStringList(passwordsKey);
    if (oldPasswords != null) {
      passwords = oldPasswords;
    }
    print("passwords $passwords");
  }

  Future<void> saveLoginAsActiveUser(
      String name, String email, String password) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setString(activeNameKey, name);
    await prefs.setString(activeEmailKey, email);
    await prefs.setString(activePasswordKey, password);
  }

  void getRelatedValues(int index) {
    correctPassword = passwords.elementAt(index);
    name = names.elementAt(index);
  }

  @override
  void initState() {
    super.initState();
    (() async {
      await getOldValues();
    })();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Form(
          key: _emailKey,
          child: loginSignUpTextField(
              width: size.width * 0.85,
              validator: (email) {
                if ((email == null) || (email.isEmpty)) {
                  return 'Please enter email';
                } else {
                  if (emails.contains(email)) {
                    print(emails);
                    getRelatedValues(emails.indexOf(email));
                    setEmail = email;
                    return null;
                  } else {
                    return "Email is not registered";
                  }
                }
              },
              keyboardtype: TextInputType.emailAddress,
              labelText: "Your email",
              prefixIcon: Icons.person),
        ),
        Form(
          key: _passwordKey,
          child: loginSignUpTextField(
              width: size.width * 0.85,
              obscuretext: _obscuretext,
              validator: (password) {
                if ((password == null) || (password.isEmpty)) {
                  return "Enter password";
                } else if (password != correctPassword) {
                  print("Password $password");
                  print("Correct Password $correctPassword");
                  return "Invalid password";
                } else {
                  return null;
                }
              },
              keyboardtype: TextInputType.text,
              textInputAction: TextInputAction.done,
              labelText: "Your password",
              prefixIcon: Icons.lock,
              suffixIcon: suffixIcon(),
              onPressedSuffixIcon: () {
                setState(() {
                  _obscuretext = !_obscuretext;
                });
              }),
        ),
        SizedBox(height: size.height * 0.025),
        buttonWidget(
            context: context,
            text: "Log in",
            width: size.width * 0.8,
            text_size: 20.0,
            isLogin: true,
            onpressed: () async {
              if ((_emailKey.currentState!.validate()) &&
                  (_passwordKey.currentState!.validate())) {
                await saveLoginAsActiveUser(name, setEmail, correctPassword);
                Navigator.pushReplacement<void, void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => Home(),
                  ),
                );
              }
            }),
      ],
    );
  }
}
