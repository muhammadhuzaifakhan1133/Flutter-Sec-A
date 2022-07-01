import 'package:flutter/material.dart';

class CompletedTasks extends StatefulWidget {
  const CompletedTasks({Key? key}) : super(key: key);

  @override
  State<CompletedTasks> createState() => _CompletedTasksState();
}

class _CompletedTasksState extends State<CompletedTasks> {
  bool tileExpanded = false;
  List<String> expansionTitle = ["foods", "places"];
  List<String> expansionSubTitle = [
    "Your favourite food is here",
    "Your favorite places is here"
  ];
  List<List<String>> childrens = [
    ["biryani", "Qourma", "Custord"],
    ["Mazar e Qaid", "Sea View", "Karli Jheel", "Farm House"]
  ];

  createExpansionTiles() {
    List<Widget> tileWidgets = [];
    for (var i = 0; i < expansionTitle.length; i++) {
      List<Widget> listTiles = [];
      for (var j = 0; j < childrens[i].length; j++) {
        listTiles.add(ListTile(title: Text(childrens[i][j])));
      }
      tileWidgets.add(ExpansionTile(
          initiallyExpanded: true,
          title: Text(expansionTitle[i]),
          subtitle: Text(expansionSubTitle[i]),
          trailing: Icon(tileExpanded
              ? Icons.arrow_drop_down_circle
              : Icons.arrow_drop_down),
          onExpansionChanged: (bool expanded) {
            setState(() {
              tileExpanded = expanded;
            });
          },
          children: listTiles));
    }
    return tileWidgets;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: createExpansionTiles(),
        ),
      ),
    );
  }
}
