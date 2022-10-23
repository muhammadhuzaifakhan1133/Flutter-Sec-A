import 'package:flutter/material.dart';
import 'package:login_louoj/views/signin/widgets/background_clipper.dart';

class SigninBackground extends StatelessWidget {
  const SigninBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.black,
          body: Row(
            children: [
              Expanded(child: Container()),
              Expanded(
                  flex: 30,
                  child: ClipPath(
                      clipper: SigninBackgroundClipper(),
                      child: Container(color: Colors.grey[200])))
            ],
          )),
    );
  }
}
