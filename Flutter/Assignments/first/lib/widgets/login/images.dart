import 'package:flutter/material.dart';

loginImages() {
  return Container(
    margin: const EdgeInsets.only(right: 10),
    height: 250,
    child: Stack(
      children: [
        Positioned(
          top: 0,
          right: 60,
          child: Image(
            image: AssetImage("assets/images/login_clouds.png"),
            height: 150,
          ),
        ),
        Positioned(
            top: 60,
            right: 100,
            child: Image(
              image: AssetImage("assets/images/login_mobile.png"),
              height: 150,
            )),
        Positioned(
          bottom: 0,
          right: 130,
          child: Image(
            image: AssetImage("assets/images/login_women.png"),
            height: 150,
          ),
        )
      ],
    ),
  );
}
