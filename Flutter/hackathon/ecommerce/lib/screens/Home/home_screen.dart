import 'package:ecommerce/constants/colors.dart';
import 'package:ecommerce/widgets/textfield_widget.dart';
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
          title: textFieldWidget(
              height: size.height * 0.06,
              width: size.width * 0.7,
              prefixIcon: Icons.search,
              suffixIcon: Icons.close,
              size: size,
              controller: searchController,
              labelText: "Search",
              keyboardtype: TextInputType.text,
              textInputAction: TextInputAction.search),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: size.width * 0.07),
              child: CircleAvatar(
                backgroundImage: NetworkImage((user?.photoURL)!),
              ),
            )
          ],
          backgroundColor: Colors.white,
          bottom: TabBar(
            indicatorColor: themeColor,
            indicatorWeight: 4,
            unselectedLabelColor: Colors.grey,
            labelColor: Colors.black,
            labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            tabs: const [
              Tab(text: "Women"),
              Tab(text: "Men"),
              Tab(text: "Children"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(
              child: Text("Women Collection"),
            ),
            Center(
              child: Text("Men Collection"),
            ),
            Center(
              child: Text("Children Collection"),
            ),
          ],
        ),
      ),
    );
  }
}
