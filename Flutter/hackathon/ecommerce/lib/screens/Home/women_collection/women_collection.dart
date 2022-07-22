import 'package:ecommerce/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class WomenCollection extends StatefulWidget {
  const WomenCollection({Key? key}) : super(key: key);

  @override
  State<WomenCollection> createState() => _WomenCollectionState();
}

class _WomenCollectionState extends State<WomenCollection> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Column(
      children: [
        Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: Colors.white,
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundImage:
                                  AssetImage("assets/images/author1.png"),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Sandy Williams",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Freelance Tailor",
                                    style: TextStyle(
                                        letterSpacing: 2,
                                        color: Color(0xffD6D6D6),
                                        fontSize: 10.57),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.favorite,
                              color: Colors.red,
                            ),
                            Text(
                              "2.3K",
                              style: TextStyle(fontSize: 12),
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      "If you are looking for the latest and the most stylish Pakistan lawn collection 2018 with chiffon dupatta, you have come at the right place as Alkaram has brought fully embroidered lawn suits with chiffon and sleeves in its wide range of stitched and unstitched lawn suits.",
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image(image: AssetImage("assets/images/image1_1.png")),
                        Column(
                          children: [
                            Row(
                              children: const [
                                Image(
                                    image: AssetImage(
                                        "assets/images/image1_2.png")),
                                Image(
                                    image: AssetImage(
                                        "assets/images/image1_3.png")),
                              ],
                            ),
                            Row(
                              children: const [
                                Image(
                                    image: AssetImage(
                                        "assets/images/image1_4.png")),
                                Image(
                                    image: AssetImage(
                                        "assets/images/image1_5.png")),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 35,
                              width: 80,
                              child: Card(
                                elevation: 4,
                                color: themeColor,
                                child: Center(
                                    child: Text("#Summer",
                                        style: TextStyle(color: Colors.white))),
                              ),
                            ),
                            Container(
                              height: 35,
                              width: 80,
                              child: Card(
                                elevation: 4,
                                color: themeColor,
                                child: Center(
                                    child: Text("#Purple",
                                        style: TextStyle(color: Colors.white))),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image(
                                image: AssetImage(
                                    "assets/images/forward_icon.png")),
                            Text(
                              "1.2K",
                              style: TextStyle(color: Color(0xffD6D6D6)),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    ));
  }
}
