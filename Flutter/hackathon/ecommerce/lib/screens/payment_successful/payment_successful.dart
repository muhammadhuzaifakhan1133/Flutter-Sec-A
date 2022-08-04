import 'package:ecommerce/constants/colors.dart';
import 'package:ecommerce/screens/bottom_bar_controller/bottom_bar_controller.dart';
import 'package:ecommerce/widgets/button_widget.dart';
import 'package:flutter/material.dart';

class PaymentSuccessful extends StatelessWidget {
  const PaymentSuccessful({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
          child: Container(
        height: 400,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const CircleAvatar(
              radius: 40,
              backgroundColor: Color.fromARGB(255, 191, 213, 231),
              child: Icon(
                Icons.check,
                color: Colors.green,
                size: 50,
              ),
            ),
            const Text(
              "Payment Successful",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 50.0, right: 50.0),
              child: Text(
                "Your order will be ready in 5 days, including shipping, more details and options for tracking will be sent to your email",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
            ),
            const Text(
              "Thanks!!!",
              style: TextStyle(fontSize: 18),
            ),
            buttonWidget(
                size: size,
                radius: 7,
                text: "Continue Shopping",
                widthPercent: 0.6,
                heightPercent: 0.08,
                onpressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BottomBarController()),
                      (route) => false);
                },
                buttonColor: themeColor)
          ],
        ),
      )),
    );
  }
}
