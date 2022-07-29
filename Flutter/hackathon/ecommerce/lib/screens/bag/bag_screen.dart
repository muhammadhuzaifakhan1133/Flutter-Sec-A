import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/constants/colors.dart';
import 'package:ecommerce/functions/firebase.dart';
import 'package:ecommerce/widgets/profile_avatar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class BagScreen extends StatefulWidget {
  const BagScreen({Key? key}) : super(key: key);

  @override
  State<BagScreen> createState() => _BagScreenState();
}

class _BagScreenState extends State<BagScreen> {
  double totalPrice = 0;
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
    if (username != null) {
      return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("bag")
            .doc(user?.email)
            .snapshots(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text("Something went wrong"));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Scaffold(
            appBar: AppBar(
              title: Text(
                "Cart",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 35,
                    fontWeight: FontWeight.bold),
              ),
              backgroundColor: Colors.white,
              elevation: 0,
              actions: [
                Icon(
                  Icons.search,
                  size: 30,
                  color: Colors.black,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: profileAvatar(
                      userName: username!, userPhotoUrl: user?.photoURL),
                )
              ],
            ),
            bottomNavigationBar: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  RichText(
                    text: TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: "Total ",
                          style: TextStyle(color: Colors.black)),
                      TextSpan(
                          text: "\$ ${totalPrice}",
                          style: TextStyle(color: themeColor))
                    ]),
                  ),
                  Text("hello"),
                ]),
            body: ListView.builder(
              itemCount: data["productID"].length,
              itemBuilder: (BuildContext context, int index) {
                return FutureBuilder(
                  future: FirebaseFirestore.instance
                      .collection("products")
                      .doc(data["productID"][index])
                      .get(),
                  builder: (BuildContext context,
                      AsyncSnapshot<DocumentSnapshot> snapshot2) {
                    if (snapshot2.hasError) {
                      return const Center(child: Text("Something went wrong"));
                    }
                    if (snapshot2.connectionState == ConnectionState.waiting) {
                      return const SizedBox();
                    }
                    Map<String, dynamic> productData =
                        snapshot2.data!.data() as Map<String, dynamic>;

                    totalPrice += productData["price"] * data["qty"][index];

                    return ListTile(
                      title: Text(
                        productData["name"],
                      ),
                    );
                  },
                );
              },
            ),
          );
        },
      );
    } else {
      return const Center(child: CircularProgressIndicator());
    }
  }
}
