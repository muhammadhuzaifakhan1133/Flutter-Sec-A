import 'package:classwork/style/container.dart';
import 'package:classwork/style/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class GeneralProduct extends StatelessWidget {
  const GeneralProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContainerWidget(
        color: Colors.red, child: TextWidget("General Product"));
  }
}
