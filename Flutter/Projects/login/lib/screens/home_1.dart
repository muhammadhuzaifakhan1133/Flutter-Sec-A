import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Home1 extends StatelessWidget {
  const Home1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          ListTile(
            tileColor: Colors.green,
            leading: CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage("assets/images/LOGO.jpg"),
            ),
          )
        ],
      ),
    );
  }
}
