import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget currentScreen = Home1();
  int activeTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Colors.red,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: () {
                  setState(() {
                    currentScreen = Home1();
                    activeTabIndex = 0;
                  });
                },
                icon: Icon(Icons.home,
                    color:
                        (activeTabIndex == 0) ? Colors.white : Colors.black)),
            IconButton(
                onPressed: () {
                  setState(() {
                    currentScreen = Home2();
                    activeTabIndex = 1;
                  });
                },
                icon: Icon(Icons.home,
                    color: (activeTabIndex == 1) ? Colors.white : Colors.black))
          ],
        ),
      ),
      body: currentScreen,
    );
  }
}

class Home1 extends StatelessWidget {
  const Home1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Home1")),
    );
  }
}

class Home2 extends StatelessWidget {
  const Home2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Home2")),
    );
  }
}
