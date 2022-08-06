import 'package:ecommerce/screens/product_screen/measurements/cloth_measurements.dart';
import 'package:flutter/material.dart';

class MaterialDropDown extends StatefulWidget {
  MaterialDropDown(
      {required this.clothMeasurements, required this.materials, Key? key})
      : super(key: key);
  ClothMeasurements clothMeasurements;
  List<String> materials;
  @override
  State<MaterialDropDown> createState() => _MaterialDropDownState();
}

class _MaterialDropDownState extends State<MaterialDropDown> {
  @override
  Widget build(BuildContext context) {
    return Padding(
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
            value: widget.clothMeasurements.material,
            icon: const Icon(Icons.arrow_drop_down_sharp),
            items: widget.materials.map((String material) {
              return DropdownMenuItem(child: Text(material), value: material);
            }).toList(),
            onChanged: (value) {
              setState(() {
                widget.clothMeasurements.material = "$value";
              });
            },
          ),
        ],
      ),
    );
  }
}
