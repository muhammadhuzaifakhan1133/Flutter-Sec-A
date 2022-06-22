import 'package:class1/widgets/login_signup_textfield.dart';
import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
    Key? key,
    required GlobalKey<FormState> passwordKey,
    required this.correctPassword,
  })  : _passwordKey = passwordKey,
        super(key: key);

  final GlobalKey<FormState> _passwordKey;
  final String? correctPassword;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscuretext = true;
  Widget suffixIcon() {
    if (_obscuretext) {
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
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      key: widget._passwordKey,
      child: loginSignUpTextField(
          width: size.width * 0.85,
          obscuretext: _obscuretext,
          validator: (password) {
            if ((password == null) || (password.isEmpty)) {
              return "Enter password";
            } else if (password != widget.correctPassword) {
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
    );
  }
}
