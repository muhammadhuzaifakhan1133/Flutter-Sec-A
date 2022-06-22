import 'package:class1/screens/home/home.dart';
import 'package:class1/screens/login/password_field.dart';
import 'package:class1/widgets/button.dart';
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
  bool userNotRegistered = false;
  String? correctPassword;

  Future<void> alreadyEmail(String email) async {
    final SharedPreferences prefs = await _prefs;
    final List<String>? emails = prefs.getStringList('emails');
    if (((emails == null) || (emails.isEmpty))) {
      userNotRegistered = true;
    } else {
      if (!(emails.contains(email))) {
        userNotRegistered = true;
      } else {
        final List<String>? passwords = prefs.getStringList('passwords');
        int pwdInd = emails.indexOf(email);
        correctPassword = passwords?.elementAt(pwdInd);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Form(
          key: _emailKey,
          child: Container(
            width: 350,
            child: TextFormField(
              validator: (email) {
                if ((email == null) || (email.isEmpty)) {
                  return 'Please enter email';
                } else {
                  alreadyEmail(email);
                  if (userNotRegistered) {
                    return null;
                  } else {
                    return "Email is not registered";
                  }
                }
              },
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              cursorColor: Colors.black,
              onSaved: (email) {},
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                hintText: "Your email",
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Icon(
                    Icons.person,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: size.height * 0.020,
        ),
        PasswordField(
            passwordKey: _passwordKey, correctPassword: correctPassword),
        SizedBox(height: size.height * 0.03),
        buttonWidget(
            context: context,
            text: "Log in",
            button_color: Colors.black,
            width: size.width * 0.8,
            text_size: 20.0,
            validation: true,
            validation_keys: [_emailKey, _passwordKey],
            go_to: Home()),
      ],
    );
  }
}
