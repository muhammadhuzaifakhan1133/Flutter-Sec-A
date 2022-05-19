import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';



class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Color Table")),
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          child: Column(
            children: [
              Row(children: [
                Container(width:50, height: 50, color: Colors.green,),
                Container(width:50, height: 50, color: Colors.black,),
                Container(width:50, height: 50, color: Colors.brown,),
                Container(width:50, height: 50, color: Colors.deepOrange,)
              ],),
              Row(children: [
                Container(width:50, height: 50, color: Colors.amber,),
                Container(width:50, height: 50, color: Colors.deepPurple,),
                Container(width:50, height: 50, color: Colors.lime,),
                Container(width:50, height: 50, color: Colors.indigo,)
              ],),
              Row(children: [
                Container(width:50, height: 50, color: Colors.cyanAccent,),
                Container(width:50, height: 50, color: Colors.grey,),
                Container(width:50, height: 50, color: Colors.teal,),
                Container(width:50, height: 50, color: Colors.red,)
              ],),
              Row(children: [
                Container(width:50, height: 50, color: Colors.orange,),
                Container(width:50, height: 50, color: Colors.lightBlue,),
                Container(width:50, height: 50, color: Colors.yellow,),
                Container(width:50, height: 50, color: Colors.lightBlueAccent,)
              ],),
            ]
          )),
      )
        );
  }
}