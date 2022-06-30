import 'package:class1/functions/shared_preferences.dart';
import 'package:class1/screens/home/home.dart';
import 'package:class1/screens/signup/passwords_suffix_icon.dart';
import 'package:class1/widgets/button.dart';
import 'package:class1/widgets/login_signup_textfield.dart';
import 'package:flutter/material.dart';

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
  List<String> names = [];
  List<String> emails = [];
  List<String> passwords = [];
  String correctPassword = '';
  String setEmail = '';
  String name = '';
  bool _obscuretext = true;

  @override
  void initState() {
    super.initState();
    (() async {
      List<List<String>> users = await getUsers();
      emails = users[0];
      names = users[1];
      passwords = users[2];
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
                    int index = emails.indexOf(email);
                    correctPassword = passwords.elementAt(index);
                    name = names.elementAt(index);
                    setEmail = email;
                    return null;
                  } else {
                    print(passwords);
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
                  return "Invalid password";
                } else {
                  return null;
                }
              },
              keyboardtype: TextInputType.text,
              textInputAction: TextInputAction.done,
              labelText: "Your password",
              prefixIcon: Icons.lock,
              suffixIcon: suffixIcon(_obscuretext),
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
                await saveActiveUser(name, setEmail, correctPassword);
                Navigator.pushReplacement<void, void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => Home(
                      userEmail: setEmail,
                      userName: name,
                    ),
                  ),
                );
              }
            }),
      ],
    );
  }
}
