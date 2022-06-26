import 'package:class1/screens/task_main_screen/task_main_screen.dart';
import 'package:flutter/material.dart';

class TaskTiles extends StatefulWidget {
  TaskTiles(
      {required this.titles,
      required this.isTaskComplete,
      required this.functionAfterBack,
      Key? key})
      : super(key: key);
  List<String> titles;
  List<bool> isTaskComplete;
  dynamic functionAfterBack;
  @override
  State<TaskTiles> createState() => _TaskTilesState();
}

class _TaskTilesState extends State<TaskTiles> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: widget.titles.length,
        itemBuilder: (context, index) {
          return ListTile(
            tileColor: Colors.white,
            title: Text(widget.titles[index]),
            leading: IconButton(
                icon: widget.isTaskComplete[index]
                    ? Icon(Icons.check_circle)
                    : Icon(Icons.circle_outlined),
                onPressed: () {
                  setState(() {
                    widget.isTaskComplete[index] =
                        !widget.isTaskComplete[index];
                  });
                }),
            onTap: () {
              Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              TaskMainScreen(task_name: widget.titles[index])))
                  .then((_) {
                widget.functionAfterBack;
              });
            },
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: 5,
          );
        },
      ),
    );
  }
}
