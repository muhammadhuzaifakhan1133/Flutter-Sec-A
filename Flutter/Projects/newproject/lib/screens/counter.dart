import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Counter extends StatefulWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  var a = 0;
  minusValue() {
    if (a != 0) {
      setState(() {
        a--;
      });
    }
  }

  addValue() {
    setState(() {
      a++;
    });
  }

  startAgain() {
    setState(() {
      a = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "$a",
              style: TextStyle(fontSize: 40),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      addValue();
                    },
                    child: Text("Add me")),
                SizedBox(
                  width: 30,
                ),
                ElevatedButton(
                    onPressed: () {
                      minusValue();
                    },
                    child: Text("Subtract me")),
                SizedBox(
                  width: 30,
                ),
                ElevatedButton(
                    onPressed: () {
                      startAgain();
                    },
                    child: Text("Start Again")),
              ],
            ),
            SizedBox(height: 100),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Go to Login"))
          ],
        ),
      ),
    );
  }
}
