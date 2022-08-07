import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class PostData extends StatefulWidget {
  const PostData({Key? key}) : super(key: key);

  @override
  State<PostData> createState() => _PostDataState();
}

class _PostDataState extends State<PostData> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        children: [
          SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Container(
              width: 250,
              height: 40,
              decoration: BoxDecoration(border: Border.all()),
              child: const Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: TextField(
                  decoration: InputDecoration(hintText: "Enter name"),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Container(
              width: 250,
              height: 40,
              decoration: BoxDecoration(border: Border.all()),
              child: const Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: TextField(
                  decoration: InputDecoration(hintText: "Enter name"),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Container(
              width: 250,
              height: 40,
              decoration: BoxDecoration(border: Border.all()),
              child: const Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: TextField(
                  decoration: InputDecoration(hintText: "Enter name"),
                ),
              ),
            ),
          ),
          const Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Divider(thickness: 4),
          ),
        ],
      ),
    ));
  }
}
