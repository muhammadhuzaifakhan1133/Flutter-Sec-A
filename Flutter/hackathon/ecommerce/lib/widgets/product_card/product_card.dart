import 'package:ecommerce/widgets/product_card/description.dart';
import 'package:ecommerce/widgets/product_card/designer_info.dart';
import 'package:ecommerce/widgets/product_card/favorite_info.dart';
import 'package:ecommerce/widgets/product_card/keywords.dart';
import 'package:ecommerce/widgets/product_card/pics_arrangement.dart';
import 'package:ecommerce/widgets/product_card/share_info.dart';
import 'package:flutter/material.dart';

Widget productCard(
    {required String designerImgPath,
    required String designerName,
    required String designerStatus,
    required bool isUserFavoritProduct,
    required int favoriteCount,
    required String description,
    required List<String> imgPaths,
    required List<String> keywords,
    required int shareCount}) {
  return Padding(
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
                designerInfo(
                    imgPath: designerImgPath,
                    name: designerName,
                    status: designerStatus),
                productFavoriteInfo(
                    isUserFavorite: isUserFavoritProduct,
                    favoriteCount: favoriteCount),
              ],
            ),
            const SizedBox(height: 10),
            productDescription(description: description),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: arrangementOfPics(imgPaths),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                productKeywords(keywords),
                productShareInfo(shareCount)
              ],
            )
          ],
        ),
      ),
    ),
  );
}
