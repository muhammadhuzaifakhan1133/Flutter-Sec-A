import 'dart:ffi';

import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:money_converter/Currency.dart';
import 'package:money_converter/money_converter.dart';

class CurrencyConverter extends StatefulWidget {
  @override
  _CurrencyConverterState createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  TextEditingController controller = TextEditingController()..text = "1";
  String fromCountry = "PK";
  String toCountry = "US";
  String? answer;

  @override
  void initState() {
    super.initState();
// add in initState
    getAmounts(fromCountry, toCountry, controller);
  }

// call function to convert
  void getAmounts(String fromCountry, String toCountry,
      TextEditingController controller) async {
    var conversion = await MoneyConverter.convert(
        Currency(Currency.USD, amount: double.parse(controller.text)),
        Currency(toCountry));
    setState(() {
      answer = conversion.toString();
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
          "Currency Converter",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Container(
              width: 200,
              height: 200,
              child: Column(
                children: [
                  Text(
                    "Exchange Rates",
                    style: TextStyle(color: Colors.grey, fontSize: 20),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Text(
                    '$answer',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 26,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 350,
            child: TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(),
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                    "From",
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      showCountryPicker(
                        context: context,
                        exclude: [toCountry],
                        onSelect: (Country country) {
                          setState(() {
                            fromCountry = country.countryCode;
                          });
                        },
                      );
                    },
                    child: Container(
                      width: 100,
                      height: 50,
                      decoration: BoxDecoration(border: Border.all()),
                      child: Center(
                          child: Text(
                        fromCountry,
                        style: TextStyle(color: Colors.black, fontSize: 23),
                      )),
                    ),
                  ),
                ],
              ),
              IconButton(
                  onPressed: () {
                    setState(() {
                      String temp = fromCountry;
                      fromCountry = toCountry;
                      toCountry = temp;
                    });
                  },
                  icon: Icon(Icons.swap_horiz)),
              Column(
                children: [
                  Text(
                    "To",
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        toCountry = "";
                      });
                    },
                    child: Container(
                      width: 100,
                      height: 50,
                      decoration: BoxDecoration(border: Border.all()),
                      child: Center(
                          child: Text(
                        toCountry,
                        style: TextStyle(color: Colors.black, fontSize: 23),
                      )),
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
