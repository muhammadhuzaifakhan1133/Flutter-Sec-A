import 'package:flutter/material.dart';
import 'package:function_tree/function_tree.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String expression = "";
  String screenInput = "";
  // String numsToShow = "";
  List<String> arthimeticOperators = ["%", "/", "*", "+", "-"];
  double ANS = 0;

  numberPressed(String number) {
    setState(() {
      if (expression.length == 0 && number == ".") {
        expression += "0.";
        screenInput += "0.";
      } else if ((expression.length == 1) && (expression[0] == "0")) {
        expression = number;
        screenInput = number;
      } else if ((expression.length != 0) &&
          (expression[expression.length - 1] == "%")) {
        expression += "*" + number;
        screenInput += "x" + number;
      } else {
        expression += number;
        screenInput += number;
      }
      if (containOperator(expression, arthimeticOperators)) {
        ANS = expression.interpret().toDouble();
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
          if (operator == "%") {
            expression += "*0.01";
            screenInput += "%";
          } else if (operator == "*") {
            expression += "*";
            screenInput += "x";
          } else if (operator == "/") {
            expression += "/";
            screenInput += "÷";
          } else {
            expression += operator;
            screenInput += operator;
          }
        } else {
          expression =
              expression.substring(0, expression.length - 1) + operator;
          screenInput =
              screenInput.substring(0, expression.length - 1) + operator;
        }
        if (operator == "%") {
          ANS = expression.interpret().toDouble();
        }
      }
    });
  }

  operatorPressed(String operator) {
    setState(() {
      if ((operator == "D") && (expression.length != 0)) {
        if (screenInput.substring(screenInput.length - 1) == "%") {
          expression = expression.substring(0, expression.length - 4);
        } else {
          expression = expression.substring(0, expression.length - 1);
        }
        screenInput = screenInput.substring(0, screenInput.length - 1);
        if (expression.length != 0) {
          if (!(arthimeticOperators
              .contains(expression.substring(expression.length - 1)))) {
            ANS = expression.interpret().toDouble();
          }
        } else {
          ANS = 0;
        }
      }
      if (operator == "C") {
        expression = "";
        screenInput = "";
        ANS = 0;
      }
      if (operator == "=") {
        if (arthimeticOperators
                .contains(expression.substring(expression.length - 1)) &&
            (expression.substring(expression.length - 1) != "%")) {
          expression = expression.substring(0, expression.length - 1);
          screenInput = screenInput.substring(0, screenInput.length - 1);
        }
        expression = ANS.toString();
        screenInput = ANS.toString();
        ANS = 0;
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
      body: Column(
        children: [
          Container(
            height: screenHeight * 0.4,
            width: screenWidth * 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  screenInput,
                  style: TextStyle(fontSize: 30),
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  ANS.toString(),
                  style: TextStyle(fontSize: 23),
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
                        arthimeticOperatorPressed("/");
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
                        arthimeticOperatorPressed("*");
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
                        arthimeticOperatorPressed("-");
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
                        arthimeticOperatorPressed("+");
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
                                arthimeticOperatorPressed("%");
                              },
                              child: Container(
                                height: buttonHeight,
                                width: buttonWidth,
                                child: Center(
                                  child: Text(
                                    "%",
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
