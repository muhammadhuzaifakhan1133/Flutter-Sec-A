import 'package:flutter/material.dart';

class ReceiveMoney extends StatefulWidget {
  const ReceiveMoney({Key? key}) : super(key: key);

  @override
  State<ReceiveMoney> createState() => _ReceiveMoneyState();
}

class _ReceiveMoneyState extends State<ReceiveMoney> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Receive Money Page")),
    );
  }
}
