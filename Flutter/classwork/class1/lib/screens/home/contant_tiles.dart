import 'package:class1/screens/completed_tasks/completed_tasks.dart';
import 'package:class1/screens/important_tasks/important_tasks.dart';
import 'package:class1/screens/planned_tasks/planned_tasks.dart';
import 'package:class1/screens/unplanned_tasks/unplanned_tasks.dart';
import 'package:flutter/material.dart';

Widget constanstTiles({email, values}) {
  List<String> titles = ["Important", "Planned", "Unplanned", "Completed"];
  List<IconData> icons = [
    Icons.star_border,
    Icons.list_alt_outlined,
    Icons.info_outlined,
    Icons.check_circle_outline_outlined
  ];
  List<Color> colors = [Colors.red, Colors.grey, Colors.brown, Colors.green];
  List<Widget> destinations = [
    ImportantTasks(),
    PlannedTasks(),
    UnplannedTasks(),
    CompletedTasks(
      email: email,
      values: values,
    )
  ];
  return ListView.builder(
      itemCount: titles.length,
      itemBuilder: (context, index) => ListTile(
            leading: Icon(
              icons[index],
              color: colors[index],
            ),
            title: Text(titles[index]),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => destinations[index]));
            },
          ));
}
