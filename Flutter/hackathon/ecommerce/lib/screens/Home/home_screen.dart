import 'package:ecommerce/functions/firebase.dart';
import 'package:ecommerce/screens/Home/tab_bar.dart';
import 'package:ecommerce/screens/Home/tab_bar_views.dart';
import 'package:ecommerce/screens/search_screen/search_screen.dart';
import 'package:ecommerce/widgets/profile_avatar.dart';
import 'package:ecommerce/widgets/textfield_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();
  List<String> keywords = [];
  List<String> suggestions = [];
  String? username;
  String query = "";
  @override
  void initState() {
    super.initState();
    User? user = FirebaseAuth.instance.currentUser;
    String Username;
    (() async {
      Username = await getUserName(email: (user?.email)!);
      List<String> Keywords = await getProductKeywords();
      setState(() {
        username = Username;
        keywords = Keywords;
      });
    })();
  }

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    Size size = MediaQuery.of(context).size;
    if (username != null) {
      return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            leading: query.isNotEmpty
                ? IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                : null,
            title: query.isEmpty
                ? const Text(
                    "Home",
                    style: TextStyle(color: Colors.black),
                  )
                : textFieldWidget(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    initialValue: query,
                    height: size.height * 0.06,
                    width: size.width * 0.7,
                    radius: 0,
                  ),
            actions: query.isEmpty
                ? [
                    IconButton(
                        icon: const Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                        onPressed: () async {
                          var result = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SearchScreen(
                                      initialValue:
                                          query.isNotEmpty ? query : null)));
                          if (result != null) {
                            setState(() {
                              query = result;
                            });
                          } else {
                            setState(() {
                              query = "";
                            });
                          }
                        }),
                    Padding(
                      padding: EdgeInsets.only(
                          left: size.width * 0.05, right: size.width * 0.07),
                      child: profileAvatar(
                          userName: username!, userPhotoUrl: user?.photoURL),
                    )
                  ]
                : null,
            backgroundColor: Colors.white,
            bottom: PreferredSize(
                preferredSize: Size.fromHeight(80), child: tabBar()),
          ),
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: tabBarView(query: query),
          ),
        ),
      );
    } else {
      return const Center(child: CircularProgressIndicator());
    }
  }
}
