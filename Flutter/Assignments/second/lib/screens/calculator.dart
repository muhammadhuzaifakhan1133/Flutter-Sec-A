import 'package:flutter/material.dart';
import 'package:function_tree/function_tree.dart';
import 'package:second/screens/currency_converter.dart';
import 'package:second/screens/history.dart';
import 'package:second/widgets/button.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String expression = "";
  List<String> arthimeticOperators = ["/", "*", "-", "+"];
  String ANS = "";
  List<String> history_inputs = [];
  List<String> history_ans = [];

  numberPressed(String number) {
    setState(() {
      if (expression.length == 0 && number == ".") {
        expression += "0.";
      } else if ((expression.length == 1) && (expression[0] == "0")) {
        expression = number;
      } else if ((expression.length != 0) &&
          (expression[expression.length - 1] == "%")) {
        expression += "*" + number;
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
      if (expression.length != 0) {
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
      if ((operator == "D") && (expression.length != 0)) {
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
                  .contains(expression.substring(expression.length - 1)) &&
              (expression.substring(expression.length - 1) != "%")) {
            expression = expression.substring(0, expression.length - 1);
          }
          history_inputs.insert(0, expression);
          history_ans.insert(0, ANS.toString());
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
    double buttonAreaHeight = screenHeight * 0.6;
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
            icon: Icon(
              Icons.currency_exchange,
              color: Colors.green,
              size: 30,
            )),
        IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          History(history_inputs, history_ans)));
            },
            icon: Icon(
              Icons.history,
              color: Colors.green,
              size: 30,
            )),
        SizedBox(width: 10)
      ]),
      body: Column(
        children: [
          Container(
            height: screenHeight * 0.29,
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
          )
        ],
      ),
    );
  }
}
