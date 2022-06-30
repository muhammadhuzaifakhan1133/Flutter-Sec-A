import 'package:class1/functions/shared_preferences.dart';
import 'package:class1/screens/home/bottom_bar.dart';
import 'package:class1/screens/home/contant_tiles.dart';
import 'package:class1/screens/home/profile_bar.dart';
import 'package:class1/screens/home/list_tiles.dart';
import 'package:class1/screens/list_main_screen/list_main_screen.dart';
import 'package:class1/widgets/create_rename_dialog.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  Home({required this.userName, required this.userEmail, Key? key})
      : super(key: key);
  String userName;
  String userEmail;
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController controller = TextEditingController();
  List<String> lists = [];
  bool isValidAlert = false;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> getUserLists(email) async {
    final SharedPreferences prefs = await _prefs;
    List<String> oldLists = prefs.getStringList(email) ?? [];
    setState(() {
      lists = oldLists;
    });
  }

  @override
  void initState() {
    super.initState();
    (() async {
      getUserLists(widget.userEmail);
    })();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: bottomNavigationBar(
            onNewPressed: () {
              createRenameDialog(
                  context: context,
                  controller: controller,
                  hintText: "Enter list title",
                  dialogTitile: "New list",
                  finalButtonText: "CREATE LIST",
                  onPressedfinalButton: () async {
                    setState(() {
                      lists.add(controller.text);
                    });
                    await saveListLocally(lists, widget.userEmail);
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ListMainScreen(
                                  list_name: controller.text,
                                  email: widget.userEmail,
                                ))).then((_) async {
                      getUserLists(widget.userEmail);
                    });
                    isValidAlert = false;
                  });
            },
            onFolderPressed: () {}),
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileBar(email: widget.userEmail, name: widget.userName),
            SizedBox(height: size.height * 0.010),
            Container(height: 230, child: constanstTiles()),
            Divider(
              thickness: 2,
            ),
            ListTiles(
                lists: lists,
                email: widget.userEmail,
                functionAfterBack: getUserLists(widget.userEmail))
          ],
        ),
      ),
    );
  }
}
