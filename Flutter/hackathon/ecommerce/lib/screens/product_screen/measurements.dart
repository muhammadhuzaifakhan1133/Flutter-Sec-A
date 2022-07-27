import 'package:ecommerce/constants/colors.dart';
import 'package:ecommerce/screens/product_screen/cloth_size.dart';
import 'package:ecommerce/screens/product_screen/cloth_size_counters.dart';
import 'package:ecommerce/screens/product_screen/color_list_builder.dart';
import 'package:flutter/material.dart';

class ProductMeasurements extends StatefulWidget {
  ProductMeasurements({Key? key}) : super(key: key);

  @override
  State<ProductMeasurements> createState() => _ProductMeasurementsState();
}

class _ProductMeasurementsState extends State<ProductMeasurements> {
  Color dressColor = Colors.red;

  late List<bool> _colorsListSelected;
  ClothSize clothSize = ClothSize();

  @override
  void initState() {
    super.initState();
    _colorsListSelected = List.generate(colorsList.length, (index) => false);
    _colorsListSelected[colorsList.indexOf(dressColor)] = true;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return _colorsListSelected.any((e) => e == true)
        ? Scaffold(
            body: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  clothSizeCounters(clothSize: clothSize),
                  const Padding(
                    padding: const EdgeInsets.only(top: 15.0, left: 30),
                    child: Text(
                      "Color",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  SizedBox(height: 10),
                  colorsListBuilder(
                      setState: setState,
                      size: size,
                      colorsList: colorsList,
                      colorsListSelected: _colorsListSelected),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Row(
                      children: [
                        const Padding(
                          padding: const EdgeInsets.only(left: 30, right: 50),
                          child: Text(
                            "Material",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        Container(
                          height: 40,
                          width: 200,
                          decoration: BoxDecoration(border: Border.all()),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Text("Leather"),
                              ),
                              Icon(Icons.arrow_drop_down_sharp)
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: size.height * 0.1),
                ],
              ),
            ),
          )
        : SizedBox();
  }
}
