import 'package:class1/functions/shared_preferences.dart';
import 'package:class1/screens/list_main_screen/create_task/create_task.dart';
import 'package:class1/screens/list_main_screen/pop_menu_button.dart';
import 'package:class1/screens/list_main_screen/task_tiles.dart';
import 'package:class1/widgets/create_rename_dialog.dart';
import 'package:flutter/material.dart';

class ListMainScreen extends StatefulWidget {
  ListMainScreen({required this.list_name, required this.email, Key? key})
      : super(key: key);
  String list_name;
  String email;

  @override
  State<ListMainScreen> createState() => _ListMainScreenState();
}

class _ListMainScreenState extends State<ListMainScreen> {
  bool isValidAlert = false;

  TextEditingController controller = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  List<bool> isTasksComplete = [];
  List<bool> isTasksImportant = [];
  List<String> tasksDate = [];
  List<String> tasksTime = [];
  List<String> tasksTitle = [];

  renameListDialog() {
    Future.delayed(const Duration(seconds: 0), () {
      createRenameDialog(
          context: context,
          controller: controller,
          hintText: widget.list_name,
          dialogTitile: "Rename list",
          finalButtonText: "SAVE",
          onPressedfinalButton: () async {
            await renameList(widget.email, widget.list_name, controller.text);
            setState(() {
              widget.list_name = controller.text;
            });
            Navigator.pop(context, true);
            isValidAlert = false;
          });
    });
  }

  @override
  void initState() {
    super.initState();
    (() async {
      List<List<dynamic>> values =
          await getTaskList(widget.email, widget.list_name);
      setState(() {
        tasksTitle = values[0] as List<String>;
        isTasksComplete = values[1] as List<bool>;
        isTasksImportant = values[2] as List<bool>;
        tasksDate = values[3] as List<String>;
        tasksTime = values[4] as List<String>;
      });
    })();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context, true);
          },
        ),
        actions: <Widget>[
          popMenuButton(onRenamePressed: () {
            renameListDialog();
          }, onDeletePressed: () async {
            await deleteList(widget.email, widget.list_name);
            Navigator.pop(context);
          }),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 50,
              color: Colors.blue,
              child: InkWell(
                onTap: () {
                  renameListDialog();
                },
                child: Text(
                  widget.list_name,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            TaskTiles(
                list_name: widget.list_name,
                tasksTitle: tasksTitle,
                isTasksComplete: isTasksComplete,
                isTasksImportant: isTasksImportant,
                tasksTime: tasksTime,
                tasksDate: tasksDate)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          createOrUpdateTask(
              context: context,
              titleController: controller,
              dateController: dateController,
              timeController: timeController,
              hintText: "New taks",
              dialogTitile: "Enter task title",
              finalButtonText: "CREATE",
              onPressedfinalButton: () {
                setState(() {
                  tasksTitle.add(controller.text);
                  isTasksComplete.add(false);
                  isTasksImportant.add(false);
                  tasksTime.add(timeController.text);
                  tasksDate.add(dateController.text);
                });
                saveTaskLocally(widget.email, widget.list_name, tasksTitle,
                    isTasksComplete, isTasksImportant, tasksDate, tasksTime);
                dateController.text = "";
                timeController.text = "";
                Navigator.pop(context);
              });
        },
        backgroundColor: Colors.white,
        child: Icon(
          Icons.add,
          color: Colors.blue,
        ),
      ),
    );
  }
}
