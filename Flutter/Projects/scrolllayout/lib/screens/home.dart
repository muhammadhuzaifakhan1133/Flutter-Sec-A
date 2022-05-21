import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [Icon(Icons.logout)],
        title: Text("Scrolling in both Directions"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                width: double.infinity,
                height: 200,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 15, left: 15),
                        width: 200,
                        color: Colors.blue,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15, left: 15),
                        width: 200,
                        color: Colors.orange,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15, left: 15),
                        width: 200,
                        color: Colors.red,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15, left: 15, right: 15),
                        width: 200,
                        color: Colors.green,
                      ),
                    ],
                  ),
                )),
            Container(
              width: double.infinity,
              height: 200,
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              width: double.infinity,
              height: 200,
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 15),
                    width: 157,
                    color: Colors.blue[300],
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15, right: 15),
                    width: 157,
                    color: Colors.brown,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              width: double.infinity,
              height: 200,
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 15),
                    width: 157,
                    color: Colors.deepOrange,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15, right: 15),
                    width: 157,
                    color: Colors.deepPurple,
                  ),
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 15),
                width: double.infinity,
                height: 200,
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      width: 157,
                      color: Colors.green,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15, right: 15),
                      width: 157,
                      color: Colors.blueGrey,
                    )
                  ],
                )),
            Container(
              margin: EdgeInsets.only(top: 15, bottom: 15),
              width: double.infinity,
              height: 200,
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 15),
                    width: 157,
                    color: Colors.brown,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15, right: 15),
                    width: 157,
                    color: Colors.deepPurple,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
