import 'package:class1/constants/local_storage_keys.dart';
import 'package:class1/screens/home/bottom_bar.dart';
import 'package:class1/screens/home/contant_tiles.dart';
import 'package:class1/screens/home/profile_bar.dart';
import 'package:class1/screens/home/task_tiles.dart';
import 'package:class1/screens/task_main_screen/task_main_screen.dart';
import 'package:class1/widgets/list_name_entry.dart';
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

  _displayDialog(BuildContext context) async {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              title: Text('New list'),
              content: TextFormField(
                onChanged: (text) {
                  setState(() {
                    if (text.isNotEmpty) {
                      isValidAlert = true;
                    } else {
                      isValidAlert = false;
                    }
                  });
                },
                decoration: InputDecoration(hintText: 'Enter list tile'),
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    isValidAlert = false;
                  },
                  child: Text("CANCEL"),
                ),
                TextButton(
                  onPressed: isValidAlert
                      ? () {
                          Navigator.pop(context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TaskMainScreen()));
                          isValidAlert = false;
                        }
                      : null,
                  child: Text("CREATE LIST"),
                )
              ],
            );
          });
        });
  }

  @override
  void initState() {
    super.initState();
    // lists = [];
    if (email == "") {
      (() async {
        await getActiveUser();
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
              _displayDialog(context);
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
            taskTiles(lists)
          ],
        ),
      ),
    );
  }
}
