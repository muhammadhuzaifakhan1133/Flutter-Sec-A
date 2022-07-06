import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todolist/widgets/button.dart';
import 'package:todolist/widgets/text_field.dart';
import 'package:todolist/widgets/title_with_image.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final nameKey = GlobalKey<FormState>();
  final emailKey = GlobalKey<FormState>();
  final passwordKey = GlobalKey<FormState>();
  final confirmPasswordKey = GlobalKey<FormState>();
  bool obscureTextPassword = true;
  bool obscureTextConfirmPassword = true;
  String? emailError;
  String? nameError;
  String? passwordError;
  String? confirmPasswordError;

  IconData suffixIcon(bool obscure) {
    if (obscure) {
      return Icons.visibility;
    } else {
      return Icons.visibility_off;
    }
  }

  addUser() async {
    if (nameController.text.isEmpty) {
      setState(() {
        nameError = "Enter name please...";
      });
      return 0;
    }
    if (emailController.text.isEmpty) {
      setState(() {
        emailError = "Enter email please...";
      });
      return 0;
    }
    if (passwordController.text.isEmpty) {
      setState(() {
        passwordError = "Enter password please...";
      });
      return 0;
    }
    if (confirmPasswordController.text != passwordController.text) {
      setState(() {
        confirmPasswordError = "Password mismatch";
      });
      return 0;
    }
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        setState(() {
          passwordError = 'The password provided is too weak.';
        });
        return 0;
      } else if (e.code == 'email-already-in-use') {
        setState(() {
          emailError = "The account already exists for that email.";
        });
        return 0;
      }
    } catch (e) {
      SnackBar snackBar = SnackBar(
        content: Text(e.toString()),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return 0;
    }
  }

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
              textFieldWidget(
                  formKey: nameKey,
                  size: size,
                  errorText: nameError,
                  controller: nameController,
                  labelText: "Enter name",
                  keyboardtype: TextInputType.name),
              textFieldWidget(
                  formKey: emailKey,
                  size: size,
                  errorText: emailError,
                  controller: emailController,
                  labelText: "Enter email",
                  keyboardtype: TextInputType.emailAddress),
              textFieldWidget(
                  formKey: passwordKey,
                  size: size,
                  errorText: passwordError,
                  controller: passwordController,
                  labelText: "Enter password",
                  obscureText: obscureTextPassword,
                  keyboardtype: TextInputType.visiblePassword,
                  suffixIcon: suffixIcon(obscureTextPassword),
                  onPressedSuffixIcon: () {
                    setState(() {
                      obscureTextPassword = !obscureTextPassword;
                    });
                  }),
              textFieldWidget(
                  formKey: confirmPasswordKey,
                  size: size,
                  errorText: confirmPasswordError,
                  controller: confirmPasswordController,
                  labelText: "Enter confirm password",
                  obscureText: obscureTextConfirmPassword,
                  keyboardtype: TextInputType.visiblePassword,
                  suffixIcon: suffixIcon(obscureTextConfirmPassword),
                  onPressedSuffixIcon: () {
                    setState(() {
                      obscureTextConfirmPassword = !obscureTextConfirmPassword;
                    });
                  }),
              buttonWidget(
                  size: size,
                  text: "Sign up",
                  onpressed: () {
                    nameError = emailError =
                        passwordError = confirmPasswordError = null;
                    addUser();
                  })
            ],
          ),
        ),
      ),
    );
  }
}
