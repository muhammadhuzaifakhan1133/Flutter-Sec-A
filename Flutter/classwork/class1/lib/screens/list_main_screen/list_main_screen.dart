import 'package:class1/constants/local_storage_keys.dart';
import 'package:class1/screens/home/home.dart';
import 'package:class1/screens/list_main_screen/pop_menu_button.dart';
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
          }, onDeletePressed: () {
            deleteList();
            Navigator.pop(context);
          }),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 13.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.list_name,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.white,
        child: Icon(
          Icons.add,
          color: Colors.blue,
        ),
      ),
    );
  }
}
