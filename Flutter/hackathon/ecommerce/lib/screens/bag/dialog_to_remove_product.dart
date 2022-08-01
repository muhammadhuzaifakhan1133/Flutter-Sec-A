import 'package:ecommerce/functions/close_dialog.dart';
import 'package:ecommerce/functions/firebase.dart';
import 'package:ecommerce/functions/sharedprefences.dart';
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
            title: const Text("Remove product",
                style: TextStyle(color: Colors.red)),
            content: const Text(
                "Are you sure you want to remove this product from your bag"),
            actions: [
              TextButton(
                child: const Text("No"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.red),
                onPressed: () async {
                  circleProgressDialog(context);
                  await removeProductFromBag(index: index);
                  double updatedTotalPrice = await getTotalPriceOfBagProducts();
                  setState(() {
                    bagProducts.totalPrice = updatedTotalPrice;
                  });
                  // ignore: use_build_context_synchronously
                  closeDialog(context);
                  // ignore: use_build_context_synchronously
                  Navigator.pop(context);
                },
                child: const Text("Yes"),
              )
            ],
          ));
}
