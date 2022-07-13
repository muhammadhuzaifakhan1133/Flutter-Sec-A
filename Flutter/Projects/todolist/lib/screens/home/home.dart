import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todolist/functions/firebase.dart';
import 'package:todolist/screens/home/bottom_app_bar.dart';
import 'package:todolist/screens/home/create_new_list.dart';
import 'package:todolist/screens/list_main_screen/list_main_screen.dart';
import 'package:todolist/widgets/create_rename_list_dialog.dart';
import 'package:todolist/screens/home/profile_tile.dart';
import 'package:todolist/screens/profile.dart/profile.dart';
import 'package:todolist/widgets/loading_widget.dart';

class Home extends StatefulWidget {
  Home({required this.name, Key? key}) : super(key: key);
  String? name;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String>? listIds;
  List<String>? listNames;
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    (() async {
      User? user = FirebaseAuth.instance.currentUser;

      Map<String, List<String>> data =
          await getListIdsAndNames(email: (user?.email)!);
      setState(() {
        print(data["listIds"]);
        listIds = data["listIds"];
        listNames = data["listNames"];
      });
    })();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: listNames != null
          ? Padding(
              padding: const EdgeInsets.only(right: 8.0, left: 8.0),
              child: bottomNavigationBar(
                  onNewPressed: () {
                    createNewList(
                        setState: setState,
                        context: context,
                        controller: controller,
                        email: (user?.email)!,
                        existListIds: listIds!,
                        listNames: listNames!);
                  },
                  onFolderPressed: () {}),
            )
          : null,
      body: SafeArea(
          child: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Profile(name: widget.name)));
            },
            child: profileTile(
                photoUrl: user?.photoURL,
                name: widget.name,
                email: user?.email),
          ),
          listNames != null
              ? Expanded(
                  child: ListView.builder(
                    itemCount: listNames?.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                          leading: Icon(
                            Icons.format_list_bulleted_outlined,
                            color: Color.fromARGB(255, 132, 92, 139),
                          ),
                          title: Text(listNames![index]));
                    },
                  ),
                )
              : Expanded(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [CircularProgressIndicator()],
                    ),
                  ),
                )
        ],
      )),
    );
  }
}
