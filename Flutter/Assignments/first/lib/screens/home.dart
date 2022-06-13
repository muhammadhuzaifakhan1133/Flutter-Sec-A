import 'package:first/widgets/home/money_transfer_section.dart';
import 'package:first/widgets/home/more_services_section.dart';
import 'package:first/widgets/home/recent_transaction_section.dart';
import 'package:first/widgets/home/recharge_and_bill_payment_section.dart';
import 'package:first/widgets/home/ticket_booking_section.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(top: 10, left: 10, right: 10),
        child: Column(
          children: [
            moneyTransferSection(),
            rechargeAndBillPaymentSection(),
            ticketBookingSection(),
            moreServicesSection(),
            recentTransactionSection(context)
          ],
        ),
      ),
    ));
  }
}
