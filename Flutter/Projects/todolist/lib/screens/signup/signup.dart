import 'package:flutter/material.dart';
import 'package:todolist/screens/signup/textfields_and_buttons.dart';
import 'package:todolist/widgets/title_with_image.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              titleWithImage(
                  size: size,
                  theme: theme,
                  title: "Sign up",
                  afterTitlePaddingPercent: 0.009,
                  imgPath: "assets/images/signup.jpg",
                  subTitle: "Filter task according to type and date"),
              SizedBox(height: size.height * 0.03),
              const FieldsAndButtons()
            ],
          ),
        ),
      ),
    );
  }
}
