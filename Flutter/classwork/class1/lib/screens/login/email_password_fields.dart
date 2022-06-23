import 'package:class1/constants/local_storage_keys.dart';
import 'package:class1/screens/home/home.dart';
import 'package:class1/screens/login/password_field.dart';
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
  List<String> emails = [];
  String correctPassword = '';
  String setEmail = '';
  String name = '';

  Future<void> getEmials() async {
    final SharedPreferences prefs = await _prefs;
    final List<String>? oldEmails = prefs.getStringList(emailsKey);
    print(oldEmails);
    if (oldEmails != null) {
      emails = oldEmails;
    }
  }

  Future<void> getRelatedValues(int index) async {
    final SharedPreferences prefs = await _prefs;
    final List<String>? oldPasswords = prefs.getStringList(passwordsKey);
    final List<String>? oldNames = prefs.getStringList(namesKey);
    correctPassword = oldPasswords!.elementAt(index);
    name = oldNames!.elementAt(index);
  }

  @override
  void initState() {
    super.initState();
    getEmials();
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
                    getRelatedValues(emails.indexOf(email));
                    setEmail = email;
                    return null;
                  } else {
                    print(emails);
                    return "Email is not registered";
                  }
                }
              },
              keyboardtype: TextInputType.emailAddress,
              labelText: "Your email",
              prefixIcon: Icons.person),
        ),
        PasswordField(
          passwordKey: _passwordKey,
          correctPassword: correctPassword,
        ),
        SizedBox(height: size.height * 0.025),
        buttonWidget(
            context: context,
            text: "Log in",
            width: size.width * 0.8,
            text_size: 20.0,
            validation: true,
            validation_keys: [_emailKey, _passwordKey],
            isLogin: true,
            name: name,
            email: setEmail,
            password: correctPassword,
            go_to: Home()),
      ],
    );
  }
}
