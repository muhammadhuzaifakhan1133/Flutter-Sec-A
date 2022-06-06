import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:login/Style/TextStyleWidget.dart';
import 'package:login/components/gap_box.dart';
import 'package:login/components/text_widget.dart';
import 'package:login/functions/entry_sign_in.dart';
import 'package:sign_button/sign_button.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  final emailController = TextEditingController();
  final passController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(backgroundColor: Colors.white),
      body: Container(
        //margin: EdgeInsets.only(top: 20),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                GapBox(height: 70.0),
                Container(
                  child: const Image(
                    image: AssetImage('assets/LOGO.jpg'),
                    width: 200,
                    height: 150,
                  ),
                ),
                TextWidget(
                  "Sign in",
                  style: TextStyleWidget(fontSize: 30.0),
                ),
                GapBox(height: 25.0),
                Padding(
                  padding: EdgeInsets.only(left: 30, right: 30),
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                        hintText: "Email",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30))),
                  ),
                ),
                GapBox(),
                Padding(
                  padding: EdgeInsets.only(left: 30, right: 30),
                  child: TextField(
                    controller: passController,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                      hintText: "Password",
                    ),
                  ),
                ),
                GapBox(height: 50.0),
                Container(
                  height: 40,
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {
                      Entry_Sign_in(emailController, passController);
                    },
                    child: TextWidget("Sign in"),
                  ),
                ),
                GapBox(height: 10.0),
                GestureDetector(
                  onTap: () {
                    print("Forgot Password");
                  },
                  child: TextWidget(
                    "Forgot Password",
                    style: TextStyleWidget(fontSize: 15.0),
                  ),
                ),
                GapBox(),
                SignInButton(
                  buttonType: ButtonType.google,
                  onPressed: () {
                    print("Sig in with Google");
                  },
                ),
                GapBox(height: 5.0),
                SignInButton(
                    buttonType: ButtonType.facebook,
                    onPressed: () {
                      print("Sign in with Facebook");
                    }),
                GapBox(height: 5.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextWidget(
                      "Don't have an account?",
                      style: TextStyleWidget(fontSize: 15.0),
                    ),
                    TextWidget(
                      "Sign Up",
                      style:
                          TextStyleWidget(color: Colors.blue, fontSize: 15.0),
                    )
                  ],
                ),
                GapBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
