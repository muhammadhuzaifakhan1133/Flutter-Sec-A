import 'package:ecommerce/constants/values.dart';
import 'package:flutter/material.dart';

class ColorListBuilder extends StatefulWidget {
  ColorListBuilder(
      {required this.size,
      required this.availableColors,
      required this.colorsListSelected,
      Key? key})
      : super(key: key);
  Size size;
  List<String> availableColors;
  List<bool> colorsListSelected;

  @override
  State<ColorListBuilder> createState() => _ColorListBuilderState();
}

class _ColorListBuilderState extends State<ColorListBuilder> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0, right: 20),
      child: SizedBox(
        height: 50,
        width: widget.size.width * 0.9,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: widget.availableColors.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                setState(() {
                  int trueIndex = widget.colorsListSelected.indexOf(true);
                  if (trueIndex != -1) {
                    widget.colorsListSelected[trueIndex] = false;
                  }
                  widget.colorsListSelected[index] = true;
                });
              },
              child: CircleAvatar(
                radius: 20,
                backgroundColor: colorsMap[widget.availableColors[index]],
                child: Center(
                  child: widget.colorsListSelected[index]
                      ? const Icon(Icons.check)
                      : null,
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(width: 20),
        ),
      ),
    );
  }
}
