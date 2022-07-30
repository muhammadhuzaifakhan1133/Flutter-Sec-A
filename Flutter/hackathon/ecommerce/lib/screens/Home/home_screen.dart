import 'package:ecommerce/functions/firebase.dart';
import 'package:ecommerce/screens/Home/tab_bar.dart';
import 'package:ecommerce/screens/Home/tab_bar_views.dart';
import 'package:ecommerce/screens/search_screen/search_screen.dart';
import 'package:ecommerce/widgets/profile_avatar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();

  String? username;
  @override
  void initState() {
    super.initState();
    User? user = FirebaseAuth.instance.currentUser;
    String Username;
    (() async {
      Username = await getUserName(email: (user?.email)!);
      setState(() {
        username = Username;
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
            title: const Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Text(
                "Home",
                style: TextStyle(color: Colors.black),
              ),
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SearchScreen()));
                  },
                  icon: const Icon(
                    Icons.search,
                    color: Colors.black,
                  )),
              Padding(
                padding: EdgeInsets.only(
                    left: size.width * 0.05, right: size.width * 0.07),
                child: profileAvatar(
                    userName: username!, userPhotoUrl: user?.photoURL),
              )
            ],
            backgroundColor: Colors.white,
            bottom: PreferredSize(
                preferredSize: Size.fromHeight(80), child: tabBar()),
          ),
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: tabBarView(),
          ),
        ),
      );
    } else {
      return const Center(child: CircularProgressIndicator());
    }
  }
}
