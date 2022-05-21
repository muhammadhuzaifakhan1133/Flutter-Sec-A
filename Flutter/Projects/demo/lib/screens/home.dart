import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Huzaifa"), actions: [Icon(Icons.logout)],),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(margin: EdgeInsets.only(top:10.0, bottom:10.0), width: double.infinity, height: 200, 
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child:Row(children: [
              Container(
                margin: EdgeInsets.only(right:10.0, left:10.0),
                color:Colors.green,
                width:100
              ),
              Container(
                margin: EdgeInsets.only(right:10.0, left:10.0),
                color: Colors.black,
                width:100
              ),
              Container(
                margin: EdgeInsets.only(right:10.0, left:10.0),
                color: Colors.brown,
                width:100
              ),
              Container(
                margin: EdgeInsets.only(right:10.0, left:10.0),
                color: Colors.limeAccent,
                width:100
              ),
              Container(
                margin: EdgeInsets.only(right:10.0, left:10.0),
                color: Colors.blueGrey,
                width:100
              )
            ],)),),
          Container(margin: EdgeInsets.only(top:10.0, bottom:10.0),width: double.infinity, height: 200, color: Colors.white, child: Column(children: [Text("This is blank space")],),),
          Container(margin: EdgeInsets.only(top:10.0, bottom:10.0),width: double.infinity, height: 200, 
          child: Row(children: [Container(margin: EdgeInsets.only(right:10.0, left:10.0, bottom:10.0), width: 160, color: Colors.amberAccent,),  
           Container(margin: EdgeInsets.only(right:10.0, left:10.0, bottom:10.0), width: 160, color: Colors.redAccent,)]),),
          Container(width: double.infinity, height: 200,
          child: Row(children: [Container(margin: EdgeInsets.only(right:10.0, left:10.0, bottom:10.0), width: 160, color: Colors.green), Container(margin: EdgeInsets.only(right:10.0, left:10.0, bottom:10.0), width: 160, color: Colors.brown,)]),)
        ]),
      ),
    );
  }
}