import 'package:flutter/material.dart';
import 'package:second/services/api_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  List<String>? countries = [];
  List<String> dialogCurrencies = [];
  List<String> dialogCountries = [];
  String answer = "";
  bool isProcessingComplete = false;

  @override
  void initState() {
    super.initState();
    (() async {
      Map<String, List<String>> list = await client.getCurrenciesAndCountries();
      setState(() {
        currencies = list["currencies"];
        countries = list["countries"];
      });
    })();
    getResult();
  }

  getResult() async {
    rate = await client.getRate(fromCountry, toCountry);
    if (controller.text.isNotEmpty) {
      setState(() {
        answer = (rate! * double.parse(controller.text)).toStringAsFixed(3);
        isProcessingComplete = true;
      });
    } else {
      answer = "0.00";
    }
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
      body: (isProcessingComplete)
          ? SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Container(
                      width: 200,
                      height: 200,
                      child: Column(
                        children: [
                          const Text(
                            "Exchange Rates",
                            style: TextStyle(color: Colors.grey, fontSize: 20),
                          ),
                          const SizedBox(
                            height: 35,
                          ),
                          (answer.isNotEmpty)
                              ? Text(
                                  answer,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold),
                                )
                              : const Center(
                                  child: CircularProgressIndicator()),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 350,
                    child: TextField(
                      onChanged: (String val) {
                        if (val.isNotEmpty) {
                          setState(() {
                            answer = "";
                            getResult();
                          });
                        }
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
                          InkWell(
                            onTap: () {
                              dialogCurrencies = currencies!;
                              dialogCountries = countries!;
                              showDialog(
                                  context: context,
                                  builder: (BuildContext c) {
                                    return StatefulBuilder(
                                        builder: (ctx, setState1) {
                                      return AlertDialog(
                                        title: Center(
                                            child: Text("Select Country")),
                                        content: Container(
                                          width: 400,
                                          child: Column(
                                            children: [
                                              TextField(
                                                onChanged: (String val) {
                                                  if (val.isEmpty) {
                                                    setState1(() {
                                                      dialogCurrencies =
                                                          currencies!;
                                                      dialogCountries =
                                                          countries!;
                                                    });
                                                  } else {
                                                    List<String>
                                                        tempFilterCountries =
                                                        List.of(dialogCountries.where(
                                                            (element) => element
                                                                .toLowerCase()
                                                                .contains(val
                                                                    .toLowerCase())));
                                                    List<String>
                                                        tempFilterCurrencies =
                                                        [];
                                                    for (var country
                                                        in tempFilterCountries) {
                                                      tempFilterCurrencies.add(
                                                          dialogCurrencies[
                                                              dialogCountries
                                                                  .indexOf(
                                                                      country)]);
                                                    }
                                                    setState1(() {
                                                      dialogCountries =
                                                          tempFilterCountries;
                                                      dialogCurrencies =
                                                          tempFilterCurrencies;
                                                    });
                                                    print(dialogCurrencies);
                                                  }
                                                },
                                                decoration: InputDecoration(
                                                    hintText: "Search",
                                                    prefixIcon:
                                                        Icon(Icons.search),
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15))),
                                              ),
                                              Expanded(
                                                child: ListView.builder(
                                                    itemCount:
                                                        dialogCurrencies.length,
                                                    itemBuilder:
                                                        (BuildContext ctx,
                                                            int index) {
                                                      return ListTile(
                                                        onTap: () {
                                                          setState(() {
                                                            fromCountry =
                                                                dialogCurrencies[
                                                                    index];
                                                            answer = "";
                                                            getResult();
                                                          });
                                                          Navigator.pop(
                                                              context,
                                                              dialogCountries[
                                                                  index]);
                                                        },
                                                        leading: Text(
                                                            dialogCurrencies[
                                                                index]),
                                                        title: Text(
                                                            dialogCountries[
                                                                index]),
                                                      );
                                                    }),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    });
                                  });
                            },
                            child: Container(
                              width: 100,
                              height: 60,
                              decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "${fromCountry}",
                                    style: TextStyle(fontSize: 17),
                                  ),
                                  Icon(Icons.arrow_drop_down)
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      FloatingActionButton(
                          onPressed: () {
                            String? temp = fromCountry;
                            setState(() {
                              fromCountry = toCountry;
                              toCountry = temp;
                              answer = "";
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
                          InkWell(
                            onTap: () {
                              dialogCurrencies = currencies!;
                              dialogCountries = countries!;
                              showDialog(
                                  context: context,
                                  builder: (BuildContext c) {
                                    return StatefulBuilder(
                                        builder: (ctx, setState1) {
                                      return AlertDialog(
                                        title: Center(
                                            child: Text("Select Country")),
                                        content: Container(
                                          width: 400,
                                          child: Column(
                                            children: [
                                              TextField(
                                                onChanged: (String val) {
                                                  if (val.isEmpty) {
                                                    setState1(() {
                                                      dialogCurrencies =
                                                          currencies!;
                                                      dialogCountries =
                                                          countries!;
                                                    });
                                                  } else {
                                                    List<String>
                                                        tempFilterCountries =
                                                        List.of(dialogCountries.where(
                                                            (element) => element
                                                                .toLowerCase()
                                                                .contains(val
                                                                    .toLowerCase())));
                                                    List<String>
                                                        tempFilterCurrencies =
                                                        [];
                                                    for (var country
                                                        in tempFilterCountries) {
                                                      tempFilterCurrencies.add(
                                                          dialogCurrencies[
                                                              dialogCountries
                                                                  .indexOf(
                                                                      country)]);
                                                    }
                                                    setState1(() {
                                                      dialogCountries =
                                                          tempFilterCountries;
                                                      dialogCurrencies =
                                                          tempFilterCurrencies;
                                                    });
                                                    print(dialogCurrencies);
                                                  }
                                                },
                                                decoration: InputDecoration(
                                                    hintText: "Search",
                                                    prefixIcon:
                                                        Icon(Icons.search),
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15))),
                                              ),
                                              Expanded(
                                                child: ListView.builder(
                                                    itemCount:
                                                        dialogCurrencies.length,
                                                    itemBuilder:
                                                        (BuildContext ctx,
                                                            int index) {
                                                      return ListTile(
                                                        onTap: () {
                                                          setState(() {
                                                            toCountry =
                                                                dialogCurrencies[
                                                                    index];
                                                            answer = "";
                                                            getResult();
                                                          });
                                                          Navigator.pop(
                                                              context,
                                                              dialogCountries[
                                                                  index]);
                                                        },
                                                        leading: Text(
                                                            dialogCurrencies[
                                                                index]),
                                                        title: Text(
                                                            dialogCountries[
                                                                index]),
                                                      );
                                                    }),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    });
                                  });
                            },
                            child: Container(
                              width: 100,
                              height: 60,
                              decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "${toCountry}",
                                    style: TextStyle(fontSize: 17),
                                  ),
                                  Icon(Icons.arrow_drop_down)
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
