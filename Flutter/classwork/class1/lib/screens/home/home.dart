import 'package:class1/constants/local_storage_keys.dart';
import 'package:class1/screens/home/bottom_bar.dart';
import 'package:class1/screens/home/contant_tiles.dart';
import 'package:class1/screens/home/profile_bar.dart';
import 'package:class1/screens/home/list_tiles.dart';
import 'package:class1/screens/list_main_screen/list_main_screen.dart';
import 'package:class1/widgets/create_rename_list_folder.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String name = '';
  String email = '';
  String password = '';
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  TextEditingController controller = TextEditingController();
  List<String> lists = [];
  bool isValidAlert = false;

  Future<void> getActiveUser() async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      name = prefs.getString(activeNameKey)!;
      email = prefs.getString(activeEmailKey)!;
      password = prefs.getString(activePasswordKey)!;
    });
  }

  Future<void> getUserLists() async {
    final SharedPreferences prefs = await _prefs;
    final List<String>? oldLists = prefs.getStringList(email);
    if (oldLists != null) {
      setState(() {
        lists = oldLists;
      });
    }
  }

  Future<void> saveListLocally(list_name) async {
    lists.add(list_name);
    final SharedPreferences prefs = await _prefs;
    await prefs.setStringList(email, lists);
  }

  @override
  void initState() {
    super.initState();
    if (email == "") {
      (() async {
        await getActiveUser();
        await getUserLists();
      })();
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: bottomNavigationBar(
            onNewPressed: () {
              createRenameListOrFolder(
                  context: context,
                  controller: controller,
                  hintText: "Enter list title",
                  dialogTitile: "New list",
                  finalButtonText: "CREATE LIST",
                  onPressedfinalButton: () async {
                    saveListLocally(controller.text);
                    Navigator.pop(context);
                    Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ListMainScreen(list_name: controller.text)))
                        .then((_) {
                      // you have come back to your Settings screen
                      getUserLists();
                    });
                    isValidAlert = false;
                  });
            },
            onFolderPressed: () {}),
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileBar(email: email, name: name, password: password),
            SizedBox(height: size.height * 0.010),
            Container(height: 230, child: constanstTiles()),
            Divider(
              thickness: 2,
            ),
            ListTiles(lists: lists, functionAfterBack: getUserLists())
          ],
        ),
      ),
    );
  }
}
