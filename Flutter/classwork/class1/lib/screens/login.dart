import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text("Log in"),
              Stack(
                alignment: Alignment.center,
                children: [
                  Image(image: AssetImage("assets/images/login.png")),
                  Positioned(
                      bottom: 0,
                      child: Text("Schedule task and mark important one"))
                ],
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                cursorColor: Colors.black,
                onSaved: (email) {},
                decoration: InputDecoration(
                  hintText: "Your email",
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Icon(Icons.person),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
