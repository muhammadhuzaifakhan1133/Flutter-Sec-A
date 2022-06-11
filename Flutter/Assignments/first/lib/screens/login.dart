import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: 550,
          child: Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(top: 100, left: 40, right: 70),
            child: Column(children: [
              Text(
                "LOGIN WITH YOUR MOBILE PHONE NUMBER",
                maxLines: 3,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontFamily: "Nunito",
                    fontWeight: FontWeight.bold),
              ),
              Stack(
                children: [
                  Image(
                    image: AssetImage("assets/images/login_clouds.png"),
                    height: 150,
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Row(
                      children: [
                        Image(
                          image: AssetImage("assets/images/login_women.png"),
                          height: 150,
                        ),
                        Image(
                          image: AssetImage("assets/images/login_mobile.png"),
                          height: 150,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ]),
          ),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/login_bg_purple.png"),
                  fit: BoxFit.fill))),
    );
  }
}
