import 'package:ecommerce/constants/values.dart';
import 'package:flutter/material.dart';

Padding colorsListBuilder(
    {required setState,
    required Size size,
    required List<String> availableColors,
    required List<bool> colorsListSelected}) {
  return Padding(
    padding: const EdgeInsets.only(left: 30.0, right: 20),
    child: SizedBox(
      height: 50,
      width: size.width * 0.9,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: availableColors.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              setState(() {
                int trueIndex = colorsListSelected.indexOf(true);
                if (trueIndex != -1) {
                  colorsListSelected[trueIndex] = false;
                }
                colorsListSelected[index] = true;
              });
            },
            child: CircleAvatar(
              radius: 20,
              backgroundColor: colorsMap[availableColors[index]],
              child: Center(
                child:
                    colorsListSelected[index] ? const Icon(Icons.check) : null,
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 20),
      ),
    ),
  );
}
