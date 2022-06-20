import 'dart:ffi';

import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:money_converter/Currency.dart';
import 'package:money_converter/money_converter.dart';
import 'package:second/services/api_client.dart';
import 'package:second/widgets/drop_down.dart';

class CurrencyConverter extends StatefulWidget {
  @override
  _CurrencyConverterState createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  TextEditingController controller = TextEditingController()..text = "1";
  ApiClient client = ApiClient();
  String? fromCountry = "USD";
  String? toCountry = "PKR";
  double? rate;
  List<String>? currencies = [];
  String? answer;

  @override
  void initState() {
    super.initState();
    (() async {
      List<String> list = await client.getCurrencies();
      setState(() {
        currencies = list;
        currencies?.sort();
      });
    })();
    getResult();
  }

  getResult() async {
    rate = await client.getRate(fromCountry, toCountry);
    setState(() {
      answer = (rate! * double.parse(controller.text)).toStringAsFixed(3);
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
      body: SingleChildScrollView(
        child: Column(
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
                onSubmitted: (String val) {
                  setState(() {
                    getResult();
                  });
                },
                controller: controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Enter an amount to convert",
                    labelText: "Amount",
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
                    customDropDown(currencies!, (val) {
                      setState(() {
                        fromCountry = val;
                        getResult();
                      });
                    }, val: fromCountry)
                  ],
                ),
                FloatingActionButton(
                    onPressed: () {
                      String? temp = fromCountry;
                      setState(() {
                        fromCountry = toCountry;
                        toCountry = temp;
                      });
                      getResult();
                    },
                    child: Icon(Icons.swap_horiz)),
                Column(
                  children: [
                    Text(
                      "To",
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    customDropDown(currencies!, (val) {
                      setState(() {
                        toCountry = val;
                        getResult();
                      });
                    }, val: toCountry)
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
