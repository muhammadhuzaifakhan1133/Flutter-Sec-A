import 'package:counter/counter.dart';
import 'package:ecommerce/constants/colors.dart';
import 'package:ecommerce/screens/product_screen/cloth_measurements.dart';
import 'package:ecommerce/screens/product_screen/cloth_size_counters.dart';
import 'package:ecommerce/screens/product_screen/color_list_builder.dart';
import 'package:flutter/material.dart';

class ProductMeasurements extends StatefulWidget {
  ProductMeasurements({required this.price, Key? key}) : super(key: key);
  final price;
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
  ClothMeasurements clothMeasurements = ClothMeasurements();

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
                  clothSizeCounters(clothMeasurements: clothMeasurements),
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
                        const Padding(
                          padding: EdgeInsets.only(right: 50.0),
                          child:
                              Text("Quantity", style: TextStyle(fontSize: 18)),
                        ),
                        Counter(
                          min: 1,
                          max: 10000000,
                          initial: 1,
                          onValueChanged: (num value) {
                            Future.delayed(Duration.zero, () {
                              setState(() {
                                clothMeasurements.qty = value.toInt();
                              });
                            });
                          },
                        ),
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
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 32.0, top: 30, bottom: 30),
                    child: Row(
                      children: [
                        Text("Total:", style: TextStyle(fontSize: 18)),
                        Text(
                          " \$ ${clothMeasurements.qty * widget.price}",
                          style: TextStyle(
                              color: themeColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        : const SizedBox();
  }
}
