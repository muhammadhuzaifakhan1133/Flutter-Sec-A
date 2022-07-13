import 'package:flutter/material.dart';
import 'package:todolist/functions/firebase.dart';
import 'package:todolist/screens/login/login.dart';
import 'package:todolist/screens/signup/signup.dart';
import 'package:todolist/widgets/button.dart';
import 'package:todolist/widgets/title_with_image.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            children: [
              SizedBox(height: size.height * 0.03),
              titleWithImage(
                  size: size,
                  theme: theme,
                  title: "Welcome",
                  imgPath: "assets/images/welcome.jpg",
                  subTitle: "Maintain your day to day tasks"),
              SizedBox(height: size.height * 0.05),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // ElevatedButton(
                    //     onPressed: () {
                    //       checkIfEmailInUse(
                    //           "muhammadhuzaifakhan2003@gmail.com", context);
                    //     },
                    //     child: Text("Get Providers")),
                    buttonWidget(
                        size: size,
                        text: "Login",
                        onpressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => const Login())));
                        }),
                    buttonWidget(
                        size: size,
                        text: "Sign up",
                        onpressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignUp()));
                        }),
                    SizedBox(height: size.height * 0.04)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
