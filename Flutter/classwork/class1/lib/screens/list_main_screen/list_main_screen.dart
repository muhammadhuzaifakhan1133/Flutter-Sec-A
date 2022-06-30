import 'package:class1/constants/local_storage_keys.dart';
import 'package:class1/functions/shared_preferences.dart';
import 'package:class1/screens/list_main_screen/create_task.dart';
import 'package:class1/screens/list_main_screen/pop_menu_button.dart';
import 'package:class1/screens/list_main_screen/task_tiles.dart';
import 'package:class1/widgets/create_rename_dialog.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class ListMainScreen extends StatefulWidget {
  ListMainScreen({required this.list_name, required this.email, Key? key})
      : super(key: key);
  late String list_name;
  String email;

  @override
  State<ListMainScreen> createState() => _ListMainScreenState();
}

class _ListMainScreenState extends State<ListMainScreen> {
  bool isValidAlert = false;

  TextEditingController controller = TextEditingController();
  TextEditingController dateTimeController = TextEditingController();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
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

  saveTaskLocally() async {
    final SharedPreferences prefs = await _prefs;
    String email = (prefs.getString(activeEmailKey))!;
    prefs.setStringList(email + widget.list_name, tasksTitle);

    List<String> isTasksCompleteString = [];
    isTasksComplete.forEach((item) => item == true
        ? isTasksCompleteString.add("ture")
        : isTasksCompleteString.add("false"));
    prefs.setStringList(
        email + widget.list_name + taskCompletionKey, isTasksCompleteString);

    List<String> isTasksImportantString = [];
    isTasksImportant.forEach((item) => item == true
        ? isTasksImportantString.add("ture")
        : isTasksImportantString.add("false"));
    prefs.setStringList(
        email + widget.list_name + taskImportancyKey, isTasksImportantString);

    prefs.setStringList(email + widget.list_name + taskDateKey, tasksDate);
    prefs.setStringList(email + widget.list_name + taskTimeKey, tasksTime);
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
          }, onDeletePressed: () {
            deleteList(widget.email, widget.list_name);
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
              dateTimeController: dateTimeController,
              hintText: "New taks",
              dialogTitile: "Enter task title",
              finalButtonText: "CREATE",
              onPressedfinalButton: () {
                String date = dateTimeController.text != ""
                    ? dateTimeController.text.split(' ')[0]
                    : "None";
                String time = dateTimeController.text != ""
                    ? dateTimeController.text.split(" ")[1].split(".")[0]
                    : "None";
                setState(() {
                  tasksTitle.add(controller.text);
                  isTasksComplete.add(false);
                  isTasksImportant.add(false);
                  tasksTime.add(time);
                  tasksDate.add(date);
                });
                saveTaskLocally();
                dateTimeController.text = "";
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
