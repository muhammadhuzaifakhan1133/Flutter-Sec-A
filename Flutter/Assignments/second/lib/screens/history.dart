import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class History extends StatefulWidget {
  History({Key? key}) : super(key: key);

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  List<String> history_inputs = [];
  List<String> history_ans = [];
  @override
  void initState() {
    super.initState();
    getHistory();
  }

  void getHistory() async {
    final SharedPreferences prefs = await _prefs;
    final List<String>? inputs = prefs.getStringList('inputs');
    final List<String>? answers = prefs.getStringList('answers');
    if (((inputs != null)) && (answers != null)) {
      setState(() {
        history_inputs = inputs;
        history_ans = answers;
      });
    }
  }

  Future<void> deleteHistory() async {
    final SharedPreferences prefs = await _prefs;
    final deleteInputsSuccess = await prefs.remove("inputs");
    final deleteAnswersSuccess = await prefs.remove("answers");
    setState(() {
      history_inputs = [];
      history_ans = [];
    });
  }

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
        ),
        actions: <Widget>[
          PopupMenuButton(
              position: PopupMenuPosition.under,
              // offset: Offset(0, 50),
              elevation: 10,
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10)),
              // splashRadius: 20,
              icon: Icon(
                Icons.more_vert,
                color: Colors.green,
              ),
              itemBuilder: (context) => <PopupMenuEntry>[
                    PopupMenuItem(
                      child: Text("Clear"),
                      onTap: () {
                        deleteHistory();
                      },
                    )
                  ])
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView.separated(
          itemCount: history_inputs.length,
          itemBuilder: (context, index) {
            return Container(
              // height: MediaQuery.of(context).size.height * 0.15,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    history_inputs[index],
                    style: TextStyle(fontSize: 30),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    history_ans[index],
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
