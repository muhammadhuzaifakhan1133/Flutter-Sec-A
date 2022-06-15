import 'package:first/widgets/button_widget.dart';
import 'package:first/widgets/mian_card.dart';
import 'package:flutter/material.dart';

class ReceiveMoney extends StatefulWidget {
  const ReceiveMoney({Key? key}) : super(key: key);

  @override
  State<ReceiveMoney> createState() => _ReceiveMoneyState();
}

class _ReceiveMoneyState extends State<ReceiveMoney> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            mainCard(
              context,
              enableTitle: true,
              enableTopRightImage: true,
              enableImage: true,
              image: "assets/images/receive_money_code.png",
              imageWidth: double.infinity,
              imageHeight: 300.0,
              title: "Recieve Money",
              title_size: 18.0,
              fontWeight: FontWeight.normal,
              top_right_img: "assets/images/receive_money_cross.png",
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Other Options",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            SizedBox(
              height: 5,
            ),
            ListTile(
              minLeadingWidth: 130,
              tileColor: Color(0xff343645),
              leading: Text(
                "Your Pay ID",
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              title: Text(
                "xyz@524899652",
                style: TextStyle(color: Color(0xffB0BEC5), fontSize: 15),
              ),
              trailing: IconButton(
                icon: Icon(Icons.copy),
                onPressed: () {},
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
