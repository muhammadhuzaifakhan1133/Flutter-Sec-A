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
  List<String>? emails = [];
  String? correctPassword;

  Future<List<String>?> getOldEmails() async {
    final SharedPreferences prefs = await _prefs;
    final List<String>? oldEmails = prefs.getStringList('emails');
    return oldEmails;
  }

  @override
  void initState() {
    super.initState();
    getOldEmails().then((value) => emails = value);
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
                  if (emails!.contains(email)) {
                    print(emails);
                    print(email);
                    return null;
                  } else {
                    print(emails);
                    print(email);
                    return "Email is not registered";
                  }
                }
              },
              keyboardtype: TextInputType.emailAddress,
              labelText: "Your email",
              prefixIcon: Icons.person),
        ),
        PasswordField(
            passwordKey: _passwordKey, correctPassword: correctPassword),
        SizedBox(height: size.height * 0.025),
        buttonWidget(
            context: context,
            text: "Log in",
            width: size.width * 0.8,
            text_size: 20.0,
            validation: true,
            validation_keys: [_emailKey, _passwordKey],
            go_to: Home()),
      ],
    );
  }
}
