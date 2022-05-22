import 'package:classwork/style/container.dart';
import 'package:classwork/style/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class FavouriteProduct extends StatelessWidget {
  const FavouriteProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContainerWidget(
        color: Colors.purple,
        child: TextWidget("Favourite Product", color: Colors.white));
  }
}
