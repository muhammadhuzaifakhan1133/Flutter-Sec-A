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
    return Form(
      key: widget._passwordKey,
      child: Container(
        width: 350,
        child: TextFormField(
          obscureText: _obscuretext,
          validator: (password) {
            if ((password == null) || (password.isEmpty)) {
              return "Enter password";
            } else if (password != widget.correctPassword) {
              return "Invalid password";
            } else {
              return null;
            }
          },
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.done,
          cursorColor: Colors.black,
          // onSaved: (email) {},
          decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)),
              hintText: "Your password",
              prefixIcon: Padding(
                padding: const EdgeInsets.all(16),
                child: Icon(
                  Icons.lock,
                  color: Colors.black,
                ),
              ),
              suffixIcon: IconButton(
                icon: suffixIcon(),
                onPressed: () {
                  setState(() {
                    _obscuretext = !_obscuretext;
                  });
                },
              )),
        ),
      ),
    );
  }
}
