import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  List<String> inputs = [];
  // String numsToShow = "";
  List<String> arthimeticOperators = ["%", "÷", "x", "+", "-"];
  double ANS = 0;

  numberPressed(String number) {
    setState(() {
      if (inputs.length == 0 && number == ".") {
        inputs.add("0.");
      } else if ((inputs.length == 1) && (inputs.elementAt(0) == "0")) {
        inputs[0] = number;
      } else if ((inputs.length != 0) && (inputs.last == "%")) {
        inputs.addAll(["x", number]);
      } else {
        inputs.add(number);
      }
      if (inputs.any(arthimeticOperators.toSet().contains)) {
        calculateResult();
      }
    });
  }

  arthimeticOperatorPressed(String operator) {
    setState(() {
      if (inputs.length != 0) {
        if ((inputs.last == "%") ||
            (!(arthimeticOperators.contains(inputs.last)))) {
          inputs.add(operator);
        } else {
          inputs[inputs.length - 1] = operator;
        }
        if (operator == "%") {
          calculateResult();
        }
      }
    });
  }

  operatorPressed(String operator) {
    setState(() {
      if ((operator == "D") && (inputs.length != 0)) {
        inputs = inputs.sublist(0, inputs.length - 1);
      }
      if (operator == "C") {
        inputs = [];
        ANS = 0;
      }
      if (operator == "=") {
        if (arthimeticOperators.contains(inputs.last) && (inputs.last != "%")) {
          inputs = inputs.sublist(0, inputs.length - 1);
          print(inputs);
        }
        inputs = [ANS.toString()];
        ANS = 0;
      }
    });
  }

  calculateResult() {
    setState(() {
      List<String> nums = [];
      String num = "";
      if (inputs.last != "%" && (arthimeticOperators.contains(inputs.last))) {
        inputs = inputs.sublist(9, inputs.length - 1);
      }
      for (var i = 0; i < inputs.length; i++) {
        if (arthimeticOperators.contains(inputs[i])) {
          if (inputs[i - 1] == "%") {
            nums.add(inputs[i]);
          } else if (i == 0) {
            nums.add(inputs[i]);
          } else {
            nums.addAll([num, inputs[i]]);
            num = "";
          }
        } else {
          num += inputs[i];
        }
      }
      print("Before $nums");
      for (int i = 0; i < nums.length; i++) {
        if ((i == 0) && (nums[i] == "-")) {
          nums.replaceRange(0, 2, ["-" + inputs[i]]);
        } else if ((inputs[i] == "-") &&
            (arthimeticOperators.contains(inputs[i - 1]))) {
          if (i == nums.length - 1) {
            nums.replaceRange(i, nums.length, [inputs[i]]);
          } else {
            nums.replaceRange(i, i + 2, ["-" + inputs[i]]);
          }
        }
      }
      if (num != "-") {
        nums.add(num);
      }
      print("after $nums");
      double ans;
      String operator;
      for (var i = 0; i < arthimeticOperators.length; i++) {
        operator = arthimeticOperators[i];
        int j = 0;
        while (nums.contains(operator)) {
          j = nums.indexOf(operator);
          if (j == -1) {
            break;
          }
          double sign = 1;
          if ((j != 1) && (nums[j - 2] == "-")) {
            sign = -1;
          }
          if (operator == "%") {
            ans = sign * double.parse(nums[j - 1]) / 100;
            if ((ans < 0) && sign == -1) {
              ans *= -1;
            }
            nums.replaceRange(j - 1, j + 1, [ans.toString()]);
          } else if (operator == "÷") {
            ans = sign * double.parse(nums[j - 1]) / double.parse(nums[j + 1]);
            if ((ans < 0) && sign == -1) {
              ans *= -1;
            }
            nums.replaceRange(j - 1, j + 2, [ans.toString()]);
          } else if (operator == "x") {
            ans = sign * double.parse(nums[j - 1]) * double.parse(nums[j + 1]);
            if ((ans < 0) && sign == -1) {
              ans *= -1;
            }
            nums.replaceRange(j - 1, j + 2, [ans.toString()]);
          } else if (operator == "+") {
            ans = sign * double.parse(nums[j - 1]) + double.parse(nums[j + 1]);
            if ((ans < 0) && sign == -1) {
              ans *= -1;
            }
            nums.replaceRange(j - 1, j + 2, [ans.toString()]);
          } else if (operator == "-") {
            ans = sign * (double.parse(nums[j - 1]) - double.parse(nums[j + 1]))
                as double;
            if ((ans < 0) && sign == -1) {
              ans *= -1;
            }
            nums.replaceRange(j - 1, j + 2, [ans.toString()]);
          }
          // print(nums);
        }
      }
      print(nums);
      ANS = double.parse(nums[0]);
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
                  inputs.join(),
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
                        arthimeticOperatorPressed("÷");
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
                        arthimeticOperatorPressed("x");
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
