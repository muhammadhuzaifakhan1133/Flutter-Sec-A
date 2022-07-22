import 'package:ecommerce/screens/Home/search_text_field.dart';
import 'package:ecommerce/screens/Home/tab_bar.dart';
import 'package:ecommerce/screens/Home/tab_bar_views.dart';
import 'package:ecommerce/widgets/profile_avatar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    Size size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title:
              searchTextFeild(screenSize: size, controller: searchController),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: size.width * 0.07),
              child: profileAvatar(
                  userName: (user?.displayName)!, userPhotoUrl: user?.photoURL),
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
  }
}
