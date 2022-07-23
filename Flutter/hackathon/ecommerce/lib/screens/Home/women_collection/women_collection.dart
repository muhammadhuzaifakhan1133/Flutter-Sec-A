import 'package:ecommerce/constants/colors.dart';
import 'package:ecommerce/widgets/product_card/product_card.dart';
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
        body: SingleChildScrollView(
      child: Column(
        children: [
          productCard(
              designerImgPath: "assets/images/designer1.png",
              designerName: "Sandy Williams",
              designerStatus: "Freelance Tailor",
              isUserFavoritProduct: true,
              favoriteCount: 2300,
              description:
                  "If you are looking for the latest and the most stylish Pakistan lawn collection 2018 with chiffon dupatta, you have come at the right place as Alkaram has brought fully embroidered lawn suits with chiffon and sleeves in its wide range of stitched and unstitched lawn suits.",
              imgPaths: [
                "assets/images/image1_1.png",
                "assets/images/image1_2.png",
                "assets/images/image1_3.png",
                "assets/images/image1_4.png",
                "assets/images/image1_5.png",
              ],
              keywords: ["Summer", "Purple"],
              shareCount: 1200),
          productCard(
              designerImgPath: "assets/images/designer1.png",
              designerName: "Sandy Williams",
              designerStatus: "Freelance Tailor",
              isUserFavoritProduct: false,
              favoriteCount: 2300,
              description:
                  "If you are looking for the latest and the most stylish Pakistan lawn collection 2018 with chiffon dupatta, you have come at the right place as Alkaram has brought fully embroidered lawn suits with chiffon and sleeves in its wide range of stitched and unstitched lawn suits.",
              imgPaths: [
                "assets/images/image1_1.png",
                "assets/images/image1_2.png",
                "assets/images/image1_3.png",
                "assets/images/image1_4.png",
                "assets/images/image1_5.png",
              ],
              keywords: ["Summer", "Purple"],
              shareCount: 1200),
          productCard(
              designerImgPath: "assets/images/designer1.png",
              designerName: "Sandy Williams",
              designerStatus: "Freelance Tailor",
              isUserFavoritProduct: true,
              favoriteCount: 2300,
              description:
                  "If you are looking for the latest and the most stylish Pakistan lawn collection 2018 with chiffon dupatta, you have come at the right place as Alkaram has brought fully embroidered lawn suits with chiffon and sleeves in its wide range of stitched and unstitched lawn suits.",
              imgPaths: [
                "assets/images/image1_1.png",
                "assets/images/image1_2.png",
                "assets/images/image1_3.png",
                "assets/images/image1_4.png",
                "assets/images/image1_5.png",
              ],
              keywords: ["Summer", "Purple"],
              shareCount: 1200),
        ],
      ),
    ));
  }
}
