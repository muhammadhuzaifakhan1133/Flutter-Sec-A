import 'package:ecommerce/functions/firebase.dart';
import 'package:flutter/material.dart';

class FavoriteIcon extends StatefulWidget {
  FavoriteIcon(
      {required this.isUserWishListProduct,
      required this.productID,
      required this.email,
      Key? key})
      : super(key: key);
  List<bool> isUserWishListProduct;
  String productID;
  String email;
  @override
  State<FavoriteIcon> createState() => _FavoriteIconState();
}

class _FavoriteIconState extends State<FavoriteIcon> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(
          widget.isUserWishListProduct[0]
              ? Icons.favorite
              : Icons.favorite_border,
          color: widget.isUserWishListProduct[0] ? Colors.red : Colors.black,
        ),
        onPressed: () async {
          if (widget.isUserWishListProduct[0]) {
            setState(() {
              widget.isUserWishListProduct[0] = false;
            });
            await removeFromUserWishList(
                email: widget.email, productID: widget.productID);
          } else {
            setState(() {
              widget.isUserWishListProduct[0] = true;
            });
            await addToUserWishList(
                email: widget.email, productID: widget.productID);
          }
        });
  }
}
