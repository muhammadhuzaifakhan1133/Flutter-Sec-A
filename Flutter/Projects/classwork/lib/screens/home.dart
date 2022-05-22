import 'package:classwork/screens/favourite_product.dart';
import 'package:classwork/screens/general_product.dart';
import 'package:classwork/screens/popular_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Class Work"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [GeneralProduct(), FavouriteProduct(), PopularProduct()],
        ),
      ),
    );
  }
}
