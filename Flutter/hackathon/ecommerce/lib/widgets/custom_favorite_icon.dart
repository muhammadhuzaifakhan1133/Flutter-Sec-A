import 'package:flutter/material.dart';

customFavoriteIcon({required bool isUserWishListProduct, required onPressed}) {
  return IconButton(
      icon: Icon(
        isUserWishListProduct ? Icons.favorite : Icons.favorite_border,
        color: isUserWishListProduct ? Colors.red : Colors.black,
      ),
      onPressed: onPressed);
}
