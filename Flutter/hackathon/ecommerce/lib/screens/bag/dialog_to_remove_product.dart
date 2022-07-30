import 'package:ecommerce/functions/close_dialog.dart';
import 'package:ecommerce/functions/firebase.dart';
import 'package:ecommerce/screens/bag/total_price_bag_products.dart';
import 'package:ecommerce/widgets/loading_widget.dart';
import 'package:flutter/material.dart';

dialogToRemoveProduct(
    {required setState,
    required BuildContext context,
    required String email,
    required int index,
    required TotalPriceBagProducts bagProducts}) {
  return showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text("Remove product", style: TextStyle(color: Colors.red)),
            content: Text(
                "Are you sure you want to remove this product from your bag"),
            actions: [
              TextButton(
                child: Text("No"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              ElevatedButton(
                child: Text("Yes"),
                style: ElevatedButton.styleFrom(primary: Colors.red),
                onPressed: () async {
                  circleProgressDialog(context);
                  await removeProductFromBag(
                      context: context, email: email, index: index);
                  double updatedTotalPrice =
                      await getTotalPriceOfBagProducts(email: email);
                  setState(() {
                    bagProducts.totalPrice = updatedTotalPrice;
                  });
                  closeDialog(context);
                  Navigator.pop(context);
                },
              )
            ],
          ));
}
