import 'package:flutter/material.dart';
import 'package:function_tree/function_tree.dart';
import 'package:second/screens/currency_converter.dart';
import 'package:second/screens/history.dart';

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
                  children: [
                    InkWell(
                      onTap: () {
                        operatorPressed("C");
                      },
                      child: Container(
                        height: buttonHeight,
                        width: buttonWidth,
                        child: Center(
                          child: Text(
                            "C",
                            style: TextStyle(color: Colors.green, fontSize: 23),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        arthimeticOperatorPressed(arthimeticOperators[0]);
                      },
                      child: Container(
                        height: buttonHeight,
                        width: buttonWidth,
                        child: Center(
                          child: Text(
                            "÷",
                            style: TextStyle(color: Colors.green, fontSize: 23),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        arthimeticOperatorPressed(arthimeticOperators[1]);
                      },
                      child: Container(
                        height: buttonHeight,
                        width: buttonWidth,
                        child: Center(
                          child: Text(
                            "x",
                            style: TextStyle(color: Colors.green, fontSize: 23),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        operatorPressed("D");
                      },
                      child: Container(
                        height: buttonHeight,
                        width: buttonWidth,
                        child: Center(
                          child: Text(
                            "DEL",
                            style: TextStyle(color: Colors.green, fontSize: 23),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        numberPressed("7");
                      },
                      child: Container(
                        height: buttonHeight,
                        width: buttonWidth,
                        child: Center(
                          child: Text(
                            "7",
                            style: TextStyle(color: Colors.black, fontSize: 23),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        numberPressed("8");
                      },
                      child: Container(
                        height: buttonHeight,
                        width: buttonWidth,
                        child: Center(
                          child: Text(
                            "8",
                            style: TextStyle(color: Colors.black, fontSize: 23),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        numberPressed("9");
                      },
                      child: Container(
                        height: buttonHeight,
                        width: buttonWidth,
                        child: Center(
                          child: Text(
                            "9",
                            style: TextStyle(color: Colors.black, fontSize: 23),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        arthimeticOperatorPressed(arthimeticOperators[2]);
                      },
                      child: Container(
                        height: buttonHeight,
                        width: buttonWidth,
                        child: Center(
                          child: Text(
                            "-",
                            style: TextStyle(color: Colors.green, fontSize: 23),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        numberPressed("4");
                      },
                      child: Container(
                        height: buttonHeight,
                        width: buttonWidth,
                        child: Center(
                          child: Text(
                            "4",
                            style: TextStyle(color: Colors.black, fontSize: 23),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        numberPressed("5");
                      },
                      child: Container(
                        height: buttonHeight,
                        width: buttonWidth,
                        child: Center(
                          child: Text(
                            "5",
                            style: TextStyle(color: Colors.black, fontSize: 23),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        numberPressed("6");
                      },
                      child: Container(
                        height: buttonHeight,
                        width: buttonWidth,
                        child: Center(
                          child: Text(
                            "6",
                            style: TextStyle(color: Colors.black, fontSize: 23),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        arthimeticOperatorPressed(arthimeticOperators[3]);
                      },
                      child: Container(
                        height: buttonHeight,
                        width: buttonWidth,
                        child: Center(
                          child: Text(
                            "+",
                            style: TextStyle(color: Colors.green, fontSize: 23),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                numberPressed("1");
                              },
                              child: Container(
                                height: buttonHeight,
                                width: buttonWidth,
                                child: Center(
                                  child: Text(
                                    "1",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 23),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                numberPressed("2");
                              },
                              child: Container(
                                height: buttonHeight,
                                width: buttonWidth,
                                child: Center(
                                  child: Text(
                                    "2",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 23),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                numberPressed("3");
                              },
                              child: Container(
                                height: buttonHeight,
                                width: buttonWidth,
                                child: Center(
                                  child: Text(
                                    "3",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 23),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                numberPressed("00");
                              },
                              child: Container(
                                height: buttonHeight,
                                width: buttonWidth,
                                child: Center(
                                  child: Text(
                                    "00",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 23),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                numberPressed("0");
                              },
                              child: Container(
                                height: buttonHeight,
                                width: buttonWidth,
                                child: Center(
                                  child: Text(
                                    "0",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 23),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                numberPressed(".");
                              },
                              child: Container(
                                height: buttonHeight,
                                width: buttonWidth,
                                child: Center(
                                  child: Text(
                                    ".",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 23),
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        operatorPressed("=");
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(15)),
                        height: buttonHeight * 2,
                        width: buttonWidth,
                        child: Center(
                          child: Text(
                            "=",
                            style: TextStyle(color: Colors.white, fontSize: 23),
                          ),
                        ),
                      ),
                    )
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
