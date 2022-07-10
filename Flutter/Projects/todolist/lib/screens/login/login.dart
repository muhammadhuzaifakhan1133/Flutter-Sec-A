import 'package:flutter/material.dart';
import 'package:todolist/screens/login/fields_and_button.dart';
import 'package:todolist/widgets/title_with_image.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              titleWithImage(
                  size: size,
                  topPaddingPercent: 0.08,
                  imgHeight: size.height * 0.35,
                  imgWidth: double.infinity,
                  theme: theme,
                  title: "Log in",
                  imgPath: "assets/images/login.png",
                  subTitle: "Separate important tasks"),
              const FieldsAndButton(),
            ],
          ),
        ),
      ),
    );
  }
}
