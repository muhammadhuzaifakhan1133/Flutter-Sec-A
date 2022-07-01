import 'package:flutter/material.dart';

class CompletedTasks extends StatefulWidget {
  const CompletedTasks({Key? key}) : super(key: key);

  @override
  State<CompletedTasks> createState() => _CompletedTasksState();
}

class _CompletedTasksState extends State<CompletedTasks> {
  bool tileExpanded = false;
  List<String> foods = ["biryani", "Qourma", "Custord"];
  List<Widget> childrens = [];

  createChildTiles() {
    for (var i = 0; i < foods.length; i++) {
      childrens.add(ListTile(title: Text(foods[i])));
    }
  }

  @override
  void initState() {
    super.initState();
    createChildTiles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            ExpansionTile(
              title: Text("Foods"),
              subtitle: Text("Your Favorite foods is here"),
              trailing: Icon(tileExpanded
                  ? Icons.arrow_drop_down_circle
                  : Icons.arrow_drop_down),
              onExpansionChanged: (bool expanded) {
                setState(() {
                  tileExpanded = expanded;
                });
              },
              children: childrens,
            )
          ],
        ),
      ),
    );
  }
}
