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
  FocusNode _focusNode = FocusNode();
  bool fieldactive = false;
  List<String> keywords = [];
  List<String> suggestions = [];

  String? username;
  @override
  void initState() {
    super.initState();
    User? user = FirebaseAuth.instance.currentUser;
    String Username;
    (() async {
      Username = await getUserName(email: (user?.email)!);
      // List<String> Keywords = await getProductKeywords();
      setState(() {
        username = Username;
        // keywords = Keywords;
        // suggestions = keywords;
      });
    })();
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    Size size = MediaQuery.of(context).size;
    if (username != null) {
      return DefaultTabController(
        length: 3,
        child: Stack(
          children: [
            Scaffold(
              appBar: AppBar(
                title: textFieldWidget(
                    height: size.height * 0.06,
                    width: size.width * 0.8,
                    focusNode: _focusNode,
                    radius: 10,
                    hintText: "Search Keyword",
                    prefixIcon: Icons.search,
                    suffixIcon:
                        searchController.text.isNotEmpty ? Icons.close : null,
                    onPressedSuffixIcon: () {
                      searchController.text = "";
                      setState(() {
                        suggestions = keywords;
                      });
                    },
                    controller: searchController,
                    onChanged: (String value) {
                      if (searchController.text.isNotEmpty) {
                        setState(() {
                          suggestions = keywords
                              .where((element) => element.contains(value))
                              .toList();
                        });
                      } else {
                        setState(() {
                          suggestions = keywords;
                        });
                      }
                    },
                    keyboardtype: TextInputType.text,
                    textInputAction: TextInputAction.search),
                actions: [
                  Padding(
                    padding: EdgeInsets.only(right: size.width * 0.07),
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
            (_focusNode.hasFocus)
                ? Positioned(
                    child: Container(
                      color: Colors.white,
                      child: ListView.builder(
                        itemCount: suggestions.length,
                        itemBuilder: (context, index) {
                          return ListTile(title: Text(suggestions[index]));
                        },
                      ),
                    ),
                  )
                : Container()
          ],
        ),
      );
    } else {
      return const Center(child: CircularProgressIndicator());
    }
  }
}
