import 'package:flutter/material.dart';

loginImages() {
  return Container(
    margin: EdgeInsets.only(right: 10),
    height: 250,
    child: Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          child: Image(
            image: AssetImage("assets/images/login_clouds.png"),
            height: 150,
          ),
        ),
        Positioned(
          bottom: 0,
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
  );
}
