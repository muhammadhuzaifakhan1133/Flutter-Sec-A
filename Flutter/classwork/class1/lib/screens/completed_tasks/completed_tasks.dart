import 'package:class1/functions/shared_preferences.dart';
import 'package:class1/screens/task_main_screen/task_main_screen.dart';
import 'package:flutter/material.dart';

class CompletedTasks extends StatefulWidget {
  CompletedTasks({required this.email, required this.values, Key? key})
      : super(key: key);
  String email;
  List<List<dynamic>> values;

  @override
  State<CompletedTasks> createState() => _CompletedTasksState();
}

class _CompletedTasksState extends State<CompletedTasks> {
  bool tileExpanded = false;
  // List<List<dynamic>> values = [];

  createExpansionTiles(values) {
    List<Widget> tileWidgets = [];
    for (var i = 0; i < values[0].length; i++) {
      List<Widget> listTiles = [];
      for (var j = 0; j < values[1][i][0].length; j++) {
        listTiles.add(ListTile(
          tileColor: Colors.white,
          title: Text(values[1][0][j],
              style: TextStyle(
                  decoration: values[1][1][j]
                      ? TextDecoration.lineThrough
                      : TextDecoration.none)),
          leading: IconButton(
              icon: values[1][1][j]
                  ? Icon(Icons.check_circle, color: Colors.blue, size: 30)
                  : Icon(Icons.circle_outlined, size: 30),
              onPressed: () async {
                setState(() {
                  values[1][1][j] = !values[1][1][j];
                });
                await saveTaskCompletionLocally(widget.email, values[0][i], j);
              }),
          subtitle: Text(values[1][3][j] + " " + values[1][4][j]),
          trailing: IconButton(
              icon: values[1][2][j]
                  ? Icon(Icons.star, color: Colors.blue, size: 30)
                  : Icon(Icons.star_border, size: 30),
              onPressed: () async {
                setState(() {
                  values[1][2][j] = !values[1][2][j];
                });
                await saveTaskImportancyLocally(widget.email, values[0][i], j);
              }),
          onTap: () {
            Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            TaskMainScreen(task_name: values[1][0][j])))
                .then((_) async {
              List<List<dynamic>> Values =
                  await getTaskList(widget.email, values[0][i]);
              values[1][0][j] = Values[0] as List<String>;
              values[1][1][j] = Values[1].map((e) => e == "true").toList();
              values[1][2][j] = Values[2].map((e) => e == "true").toList();
              values[1][3][j] = Values[3] as List<String>;
              values[1][4][j] = Values[4] as List<String>;
            });
          },
        ));
      }
      tileWidgets.add(ExpansionTile(
          initiallyExpanded: true,
          title: Text(values[0][i]),
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
  void initState() {
    super.initState();
    (() async {})();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: createExpansionTiles(widget.values),
        ),
      ),
    );
  }
}
