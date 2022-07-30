import 'package:ecommerce/screens/bag/dialog_to_remove_product.dart';
import 'package:ecommerce/screens/bag/total_price_bag_products.dart';
import 'package:flutter/material.dart';

cardRemoveIcon(
    {required setState,
    required BuildContext context,
    required String email,
    required int index,
    required TotalPriceBagProducts bagProducts}) {
  return Positioned(
    top: 5,
    right: 5,
    child: IconButton(
        onPressed: () async {
          dialogToRemoveProduct(
              setState: setState,
              context: context,
              email: email,
              index: index,
              bagProducts: bagProducts);
        },
        icon: Icon(Icons.close, color: Colors.grey)),
  );
}
