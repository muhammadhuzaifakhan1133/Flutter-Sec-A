import 'package:flutter/material.dart';
import 'package:function_tree/function_tree.dart';
import 'package:second/screens/currency_converter.dart';
import 'package:second/screens/history.dart';
import 'package:second/widgets/button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  String expression = "";
  List<String> arthimeticOperators = ["/", "*", "-", "+"];
  String ANS = "";

  @override
  void initState() {
    super.initState();
  }

  void saveHistory(String input, String answer) async {
    final SharedPreferences prefs = await _prefs;
    final List<String>? inputs = prefs.getStringList('inputs');
    final List<String>? answers = prefs.getStringList('answers');
    if ((inputs != null) || (answers != null)) {
      inputs!.insert(0, input);
      answers!.insert(0, answer);
      await prefs.setStringList('inputs', inputs);
      await prefs.setStringList('answers', answers);
    } else {
      await prefs.setStringList('inputs', [
        input,
      ]);
      await prefs.setStringList('answers', [
        answer,
      ]);
    }
  }

  numberPressed(String number) {
    setState(() {
      if (expression.isEmpty && number == ".") {
        expression += "0.";
      } else if ((expression.length == 1) && (expression[0] == "0")) {
        expression = number;
      } else {
        expression += number;
      }
      if (containOperator(expression, arthimeticOperators)) {
        ANS = expression.interpret().toString();
      }
    });
  }

  bool containOperator(String expression, List<String> arthimeticOperators) {
    for (var i = 0; i < expression.length; i++) {
      if (arthimeticOperators.contains(expression[i])) {
        return true;
      }
    }
    return false;
  }

  arthimeticOperatorPressed(String operator) {
    setState(() {
      if (expression.isNotEmpty) {
        if (!(arthimeticOperators
            .contains(expression.substring(expression.length - 1)))) {
          expression += operator;
        }
        // else if (operator == "-") {
        //   expression += operator;
        // }
        else {
          expression =
              expression.substring(0, expression.length - 1) + operator;
        }
      } else if (operator == "-") {
        expression += operator;
      }
    });
  }

  operatorPressed(String operator) {
    setState(() {
      if ((operator == "D") && (expression.isNotEmpty)) {
        expression = expression.substring(0, expression.length - 1);

        if (containOperator(expression, arthimeticOperators) &&
            (expression.length > 2)) {
          if (!(arthimeticOperators
              .contains(expression.substring(expression.length - 1)))) {
            ANS = expression.interpret().toString();
          }
        } else {
          ANS = "";
        }
      }
      if (operator == "C") {
        expression = "";

        ANS = "";
      }
      if (operator == "=") {
        if (ANS != "") {
          if (arthimeticOperators
              .contains(expression.substring(expression.length - 1))) {
            expression = expression.substring(0, expression.length - 1);
          }
          saveHistory(expression, ANS);
          expression = ANS.toString();
          ANS = "";
        }
      }
    });
  }

  List<Widget> buttonRow(List<String> labels, List<String> operators,
      List<String> types, double buttonWidth, double buttonHeight,
      {Color? buttonColor, Color? textColor, bool roundborder = false}) {
    assert(labels.length == operators.length);
    List<Widget> row = [];
    for (var i = 0; i < labels.length; i++) {
      Widget buttonWidget = button(
        labels[i],
        buttonWidth,
        buttonHeight,
        ((buttonColor == null) ? Colors.white : buttonColor),
        roundBorder: roundborder,
        color: (textColor != null)
            ? textColor
            : (((types[i] == "o") || (types[i] == "a"))
                ? Colors.green
                : Colors.black),
        onTap: () {
          if (types[i] == "o") {
            operatorPressed(operators[i]);
          } else if (types[i] == "n") {
            numberPressed(operators[i]);
          } else {
            arthimeticOperatorPressed(operators[i]);
          }
        },
      );
      row.add(buttonWidget);
    }
    return row;
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double buttonAreaWidth = screenWidth * 1;
    double buttonAreaHeight = screenHeight * 0.5;
    double buttonWidth = buttonAreaWidth / 4;
    double buttonHeight = buttonAreaHeight / 5;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(elevation: 0, backgroundColor: Colors.white, actions: [
        IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CurrencyConverter()));
            },
            icon: const Icon(
              Icons.currency_exchange,
              color: Colors.green,
              size: 30,
            )),
        IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => History()));
            },
            icon: const Icon(
              Icons.history,
              color: Colors.green,
              size: 30,
            )),
        SizedBox(width: 10)
      ]),
      body: Column(
        children: [
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: Container(
                height: screenHeight * 0.27,
                width: screenWidth * 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      expression,
                      style: TextStyle(fontSize: 30),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      (expression.length == 0) ? "" : ANS.toString(),
                      style: TextStyle(fontSize: 23),
                    ),
                    SizedBox(
                      height: 30,
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: buttonAreaWidth,
            height: buttonAreaHeight,
            // decoration: BoxDecoration(
            //     border: Border(top: BorderSide(color: Colors.grey))),
            child: Column(
              children: [
                Row(
                  children: buttonRow([
                    "C",
                    "÷",
                    "x",
                    "DEL"
                  ], [
                    "C",
                    arthimeticOperators[0],
                    arthimeticOperators[1],
                    "D"
                  ], [
                    "o",
                    "a",
                    "a",
                    "o"
                  ], buttonWidth, buttonHeight),
                ),
                Row(
                  children: buttonRow(
                      ["7", "8", "9", "-"],
                      ["7", "8", "9", arthimeticOperators[2]],
                      ["n", "n", "n", "a"],
                      buttonWidth,
                      buttonHeight),
                ),
                Row(
                  children: buttonRow(
                      ["4", "5", "6", "+"],
                      ["4", "5", "6", arthimeticOperators[3]],
                      ["n", "n", "n", "a"],
                      buttonWidth,
                      buttonHeight),
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Row(
                          children: buttonRow(["1", "2", "3"], ["1", "2", "3"],
                              ["n", "n", "n"], buttonWidth, buttonHeight),
                        ),
                        Row(
                          children: buttonRow(
                              ["00", "0", "."],
                              ["00", "0", "."],
                              ["n", "n", "n"],
                              buttonWidth,
                              buttonHeight),
                        )
                      ],
                    ),
                    buttonRow(
                        ["="], ["="], ["o"], buttonWidth, buttonHeight * 2,
                        buttonColor: Colors.green,
                        textColor: Colors.white,
                        roundborder: true)[0]
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
