import 'package:class3/widgets/tab_content.dart';
import 'package:class3/widgets/tab_names.dart';
import 'package:flutter/material.dart';

class TabBarController extends StatefulWidget {
  const TabBarController({Key? key}) : super(key: key);

  @override
  State<TabBarController> createState() => _TabBarControllerState();
}

/// AnimationControllers can be created with `vsync: this` because of TickerProviderStateMixin.
class _TabBarControllerState extends State<TabBarController>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            bottom: PreferredSize(
              preferredSize: Size(double.infinity, 60),
              child: TabBar(
                labelColor: Colors.black,
                // indicatorWeight: 5,
                // indicatorColor: Colors.white,
                tabs: tabNames(),
              ),
            ),
          ),
          drawer: Drawer(
            width: MediaQuery.of(context).size.width * 0.5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DrawerHeader(child: Text("data")),
                ListTile(
                  tileColor: Colors.grey,
                  title: Text("Profile"),
                  onTap: () {},
                ),
                ListTile(
                  tileColor: Colors.grey,
                  title: Text("Profile"),
                  onTap: () {},
                ),
                ListTile(
                  tileColor: Colors.grey,
                  title: Text("Profile"),
                  onTap: () {},
                ),
                ListTile(
                  tileColor: Colors.grey,
                  title: Text("Profile"),
                  onTap: () {},
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: tabContent(),
          ),
        ),
      ),
    );
  }
}
