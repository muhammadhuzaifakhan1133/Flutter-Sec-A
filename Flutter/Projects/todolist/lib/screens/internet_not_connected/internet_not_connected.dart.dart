import 'package:flutter/cupertino.dart';
import 'package:todolist/widgets/button.dart';

// ignore: must_be_immutable
class InternetNotConnected extends StatelessWidget {
  InternetNotConnected({required this.onpressed, Key? key}) : super(key: key);
  // ignore: prefer_typing_uninitialized_variables
  var onpressed;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Image(
              image: AssetImage("assets/images/no_internet_connection.png"),
              width: 100,
              height: 100),
          const Text("No Internet Connection", style: TextStyle(fontSize: 20)),
          buttonWidget(
              size: size,
              text: "Try Again",
              onpressed: onpressed,
              widthPercent: 0.4)
        ],
      ),
    );
  }
}
