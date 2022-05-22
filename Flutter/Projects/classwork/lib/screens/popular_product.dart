import 'package:classwork/style/container.dart';
import 'package:classwork/style/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class PopularProduct extends StatelessWidget {
  const PopularProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContainerWidget(child: TextWidget("Popular Product", size: 20.0));
  }
}
