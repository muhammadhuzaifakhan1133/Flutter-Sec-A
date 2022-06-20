import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class History extends StatefulWidget {
  History(this.history_inputs, this.history_ans, {Key? key}) : super(key: key);

  List<String> history_inputs;
  List<String> history_ans;

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.white,
          title: Text(
            "History",
            style: TextStyle(color: Colors.black),
          )),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView.separated(
          itemCount: widget.history_inputs.length,
          itemBuilder: (context, index) {
            return Container(
              // height: MediaQuery.of(context).size.height * 0.15,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    widget.history_inputs[index],
                    style: TextStyle(fontSize: 30),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.history_ans[index],
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider(
              thickness: 1,
            );
          },
        ),
      ),
    );
  }
}
