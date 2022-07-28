import 'package:counter/counter.dart';
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
  List<String> materials = [
    "Lace",
    "Ankara",
    "Guinea",
    "Linen",
    "Silk",
    "Wool",
    "Cotten"
  ];
  String dropDownValue = "Lace";
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
                    padding: const EdgeInsets.only(top: 15.0, left: 30),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 50.0),
                          child:
                              Text("Quantity", style: TextStyle(fontSize: 18)),
                        ),
                        Counter(min: 1, max: 10000000),
                      ],
                    ),
                  ),
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
                        DropdownButton(
                          value: dropDownValue,
                          icon: const Icon(Icons.arrow_drop_down_sharp),
                          items: materials.map((String material) {
                            return DropdownMenuItem(
                                child: Text(material), value: material);
                          }).toList(),
                          onChanged: (String? value) {
                            setState(() {
                              dropDownValue = value!;
                            });
                          },
                        ),
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
