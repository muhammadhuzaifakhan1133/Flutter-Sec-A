import 'package:ecommerce/constants/colors.dart';
import 'package:ecommerce/screens/intro_slider/first_text_row.dart';
import 'package:ecommerce/screens/intro_slider/fourth_text_row.dart';
import 'package:ecommerce/screens/intro_slider/second_text_row.dart';
import 'package:ecommerce/screens/intro_slider/third_text_row.dart';
import 'package:ecommerce/screens/login/login_screen.dart';
import 'package:ecommerce/widgets/button_widget.dart';
import 'package:flutter/material.dart';

renderSlides({context}) {
  Size size = MediaQuery.of(context).size;
  double height = size.height;
  double width = size.width;
  List<Widget> slides = [];
  List<String> actorNames = [
    "Jennifer Kingsley ",
    "Jimmy Chuka ",
    "Christain Lobi "
  ];
  List<String> slidesText = [
    "exploring the new range of winter fashion wear",
    "exploring new spring sweater collection",
    "showing us his new summer beach wears"
  ];
  int no_of_slides = 3;
  for (var i = 1; i <= no_of_slides; i++) {
    slides.add(Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/slider$i.png"),
              fit: BoxFit.cover)),
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(
              bottom: height * 0.1, left: width * 0.05, right: width * 0.05),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(top: height * 0.05),
                child: Image(
                    image: AssetImage("assets/images/logo.png"), height: 25),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  firstTextRow(i),
                  SizedBox(height: height * 0.01),
                  secondTextRow(),
                  SizedBox(height: height * 0.01),
                  thirdTextRow(),
                  SizedBox(height: height * 0.01),
                  fourthTextRow(actorNames, slidesText, i),
                  SizedBox(height: height * 0.03),
                  buttonWidget(
                      size: size,
                      text: "Shop Now",
                      buttonColor: Colors.transparent,
                      onpressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                      }),
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
  return slides;
}
