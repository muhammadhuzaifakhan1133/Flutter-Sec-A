import 'package:class1/constants/local_storage_keys.dart';
import 'package:class1/screens/profile/profile.dart';
import 'package:class1/screens/profile/profile_circle_image.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileBar extends StatefulWidget {
  ProfileBar({required this.name, required this.email, Key? key})
      : super(key: key);
  String name, email;

  @override
  State<ProfileBar> createState() => _ProfileBarState();
}

class _ProfileBarState extends State<ProfileBar> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  Profile(name: widget.name, email: widget.email)),
        );
      },
      leading: Hero(
          tag: "profile-pic",
          child: CircleImage(widget.name != "" ? widget.name[0] : " ")),
      title: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Flexible(
                  child: Text(
                    widget.name,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 19),
                  ),
                ),
                Icon(Icons.keyboard_arrow_down)
              ],
            ),
            Row(
              children: [
                Flexible(
                  child: Text(
                    widget.email,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.grey, fontSize: 15),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      trailing: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.search,
            color: Colors.blue,
            size: 40,
          )),
    );
  }
}
