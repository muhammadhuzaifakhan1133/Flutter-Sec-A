import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Notfications extends StatefulWidget {
  const Notfications({Key? key}) : super(key: key);

  @override
  State<Notfications> createState() => _NotficationsState();
}

class _NotficationsState extends State<Notfications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Notfications")),
    );
  }
}
