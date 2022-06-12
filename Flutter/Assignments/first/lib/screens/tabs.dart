import 'package:first/constants/user_constants.dart';

import 'package:first/widgets/tabbar/notfication_logo.dart';
import 'package:first/widgets/tabbar/profile_logo.dart';
import 'package:first/widgets/tabbar/search_bar.dart';
import 'package:first/widgets/tabbar/tab_content.dart';
import 'package:first/widgets/tabbar/tabs_names.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TabBarController extends StatefulWidget {
  const TabBarController({Key? key}) : super(key: key);

  @override
  State<TabBarController> createState() => _TabBarControllerState();
}

/// AnimationControllers can be created with `vsync: this` because of TickerProviderStateMixin.
class _TabBarControllerState extends State<TabBarController>
    with TickerProviderStateMixin {
  late TabController _tabController;
  var constants = UserConstants();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        backgroundColor: constants.appbar_bgcolor,
        leading: profileLogo(context),
        title: searchBarWidget(),
        actions: [notificationLogo(context)],
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 60),
          child: TabBar(
            indicatorWeight: 5,
            indicatorColor: Colors.white,
            controller: _tabController,
            tabs: tabNames(),
          ),
        ),
      ),
      body: TabBarView(
        physics: BouncingScrollPhysics(),
        controller: _tabController,
        children: tabContent(),
      ),
    );
  }
}
