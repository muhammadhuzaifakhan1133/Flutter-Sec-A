import 'package:class1/constants/local_storage_keys.dart';
import 'package:class1/screens/list_main_screen/pop_menu_button.dart';
import 'package:class1/screens/list_main_screen/task_tiles.dart';
import 'package:class1/widgets/create_rename_list_folder.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListMainScreen extends StatefulWidget {
  ListMainScreen({required this.list_name, Key? key}) : super(key: key);
  late String list_name;

  @override
  State<ListMainScreen> createState() => _ListMainScreenState();
}

class _ListMainScreenState extends State<ListMainScreen> {
  bool isValidAlert = false;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  TextEditingController controller = TextEditingController();
  late int listIndex;
  List<bool> isTasksComplete = [];
  List<bool> isTasksImportant = [];
  List<String> tasksDate = [];
  List<String> tasksTime = [];
  List<String> tasksTitle = [];

  Future<void> renameListLocally() async {
    final SharedPreferences prefs = await _prefs;
    String email = (prefs.getString(activeEmailKey))!;
    List<String>? lists = prefs.getStringList(email);
    listIndex = lists!.indexOf(widget.list_name);
    lists[listIndex] = controller.text;
    await prefs.setStringList(email, lists);
    setState(() {
      widget.list_name = controller.text;
    });
  }

  Future<void> deleteList() async {
    final SharedPreferences prefs = await _prefs;
    String email = (prefs.getString(activeEmailKey))!;
    List<String>? oldLists = prefs.getStringList(email);
    oldLists!.remove(widget.list_name);
    await prefs.setStringList(email, oldLists);
    Navigator.pop(context);
  }

  renameList() {
    Future.delayed(const Duration(seconds: 0), () {
      createRenameListOrFolder(
          context: context,
          controller: controller,
          hintText: widget.list_name,
          dialogTitile: "Rename list",
          finalButtonText: "SAVE",
          onPressedfinalButton: () async {
            await renameListLocally();
            Navigator.pop(context, true);
            isValidAlert = false;
          });
    });
  }

  getTaskList() async {
    final SharedPreferences prefs = await _prefs;
    String email = (prefs.getString(activeEmailKey))!;
    List<String>? tasks = prefs.getStringList(email + widget.list_name);
    List<String>? Complete =
        prefs.getStringList(email + widget.list_name + taskCompletionKey);
    List<String>? important =
        prefs.getStringList(email + widget.list_name + taskImportancyKey);
    List<String>? date =
        prefs.getStringList(email + widget.list_name + taskDateKey);
    List<String>? time =
        prefs.getStringList(email + widget.list_name + taskTimeKey);
    if ((tasks != null) &&
        (Complete != null) &&
        (important != null) &&
        (date != null) &&
        (time != null)) {
      List<bool> completeTasks = Complete.map((e) => e == "true").toList();
      List<bool> importantTasks = important.map((e) => e == "true").toList();
      setState(() {
        tasksTitle = tasks;
        isTasksComplete = completeTasks;
        isTasksImportant = importantTasks;
        tasksDate = date;
        tasksTime = time;
      });
    }
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
      await getTaskList();
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
            renameList();
          }, onDeletePressed: () {
            deleteList();
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
                  renameList();
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
          createRenameListOrFolder(
              context: context,
              controller: controller,
              hintText: "New taks",
              dialogTitile: "Enter task title",
              finalButtonText: "CREATE",
              onPressedfinalButton: () {
                setState(() {
                  tasksTitle.add(controller.text);
                  isTasksComplete.add(false);
                  isTasksImportant.add(false);
                  tasksTime.add("None");
                  tasksDate.add("None");
                });
                saveTaskLocally();
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
