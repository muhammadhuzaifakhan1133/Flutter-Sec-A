import 'package:flutter/material.dart';

class ProductInfo extends StatelessWidget {
  ProductInfo(
      {required this.materialInfo, required this.washInstruction, Key? key})
      : super(key: key);
  String materialInfo;
  String washInstruction;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "MATERIALS",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),
              Text(
                materialInfo,
                style: TextStyle(wordSpacing: 3, height: 1.5),
              ),
              const SizedBox(height: 20),
              const Text(
                "WASH INSTRUCTION",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),
              Text(
                washInstruction,
                style: TextStyle(wordSpacing: 3, height: 1.5),
              ),
              SizedBox(height: size.height * 0.08),
            ],
          ),
        ),
      ),
    );
  }
}
