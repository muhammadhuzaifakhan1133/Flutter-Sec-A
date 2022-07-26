import 'package:ecommerce/constants/colors.dart';
import 'package:ecommerce/functions/firebase.dart';
import 'package:ecommerce/widgets/button_widget.dart';
import 'package:flutter/material.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buttonWidget(
                size: size,
                buttonColor: themeColor,
                text: "add designer",
                onpressed: () {
                  addDesigner(context);
                }),
            buttonWidget(
                size: size,
                buttonColor: themeColor,
                text: "Logout",
                onpressed: () {
                  logout(context: context);
                })
          ],
        ),
      ),
    );
  }
}
