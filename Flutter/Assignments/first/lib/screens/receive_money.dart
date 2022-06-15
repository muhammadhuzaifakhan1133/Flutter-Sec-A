import 'package:first/screens/tabs.dart';
import 'package:first/widgets/button_widget.dart';
import 'package:first/widgets/mian_card.dart';
import 'package:first/widgets/receive_money/single_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ReceiveMoney extends StatefulWidget {
  const ReceiveMoney({Key? key}) : super(key: key);

  @override
  State<ReceiveMoney> createState() => _ReceiveMoneyState();
}

class _ReceiveMoneyState extends State<ReceiveMoney> {
  String id = "xyz@524899652";
  IconData copiedIcon = Icons.copy;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 25,
            ),
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
              height: 8,
            ),
            Text(
              "Other Options",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            SizedBox(
              height: 8,
            ),
            InkWell(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Copied to Clipboard !")));
                setState(() {
                  copiedIcon = Icons.check;
                });
              },
              child: singleTileCard(
                  context: context,
                  icon: copiedIcon,
                  startText: "Your Pay ID",
                  endText: id),
            ),
            SizedBox(
              height: 6,
            ),
            InkWell(
              onTap: () {
                navigateTo(context, TabBarController());
              },
              child: singleTileCard(
                context: context,
                icon: Icons.arrow_forward_ios,
                startText: "Show bank account details",
                endText: "",
              ),
            )
          ],
        ),
      )),
    );
  }
}
