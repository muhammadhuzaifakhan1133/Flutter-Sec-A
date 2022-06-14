import 'package:first/widgets/balance/rounded_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Balance extends StatefulWidget {
  const Balance({Key? key}) : super(key: key);

  @override
  State<Balance> createState() => _BalanceState();
}

class _BalanceState extends State<Balance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Card(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Theme.of(context).colorScheme.outline,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(12)),
          ),
          elevation: 15,
          color: Color.fromRGBO(31, 34, 42, 1),
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.52,
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage("assets/images/balance_icon1.png"),
                    ),
                    Text(
                      "Portfolio Value",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    Image(
                      image: AssetImage("assets/images/balance_icon2.png"),
                    )
                  ],
                ),
                Text(
                  "\$54,375",
                  style: TextStyle(
                      color: Color.fromRGBO(176, 190, 197, 1),
                      fontSize: 36,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "In 3 Accounts",
                  style: TextStyle(
                      color: Color.fromRGBO(176, 190, 197, 1),
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    roundedCardWidget(
                        bank_name: "Federal Bank",
                        account_no: "1142524899652",
                        amount: "16,456.05",
                        color: Color.fromRGBO(101, 42, 95, 1)),
                    roundedCardWidget(
                        bank_name: "States Bank",
                        account_no: "1142524899652",
                        amount: "2045.05",
                        color: Color.fromRGBO(68, 42, 101, 1)),
                  ],
                ),
                Row(
                  children: [
                    roundedCardWidget(
                        bank_name: "Best Bank",
                        account_no: "1142521547852",
                        amount: "35873.5",
                        color: Color.fromRGBO(42, 101, 80, 1)),
                    SizedBox(
                      width: 70,
                    ),
                    Image(
                      image: AssetImage("assets/images/balance_icon3.png"),
                    )
                  ],
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Add / Manage Accounts",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 43),
                    shape: RoundedRectangleBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                    ),
                    elevation: 10,
                    primary: Color.fromRGBO(52, 54, 69, 1),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
