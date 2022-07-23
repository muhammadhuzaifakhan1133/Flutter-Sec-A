import 'package:ecommerce/functions/firebase.dart';
import 'package:ecommerce/widgets/button_widget.dart';
import 'package:flutter/material.dart';

class MenCollection extends StatelessWidget {
  const MenCollection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          buttonWidget(
              size: size,
              text: "Logout",
              onpressed: () {
                logout(context: context);
              })
        ],
      ),
    );
  }
}
