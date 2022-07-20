import 'dart:async';
import 'package:ecommerce/functions/close_dialog.dart';
import 'package:ecommerce/functions/firebase.dart';
import 'package:ecommerce/functions/sharedprefences.dart';
import 'package:ecommerce/screens/Home/home_screen.dart';
import 'package:ecommerce/screens/email_verify/text_for_change_email.dart';
import 'package:ecommerce/screens/tabs/tabs.dart';
import 'package:ecommerce/widgets/button_widget.dart';
import 'package:ecommerce/widgets/loading_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

// ignore: must_be_immutable
class EmailVerificationScreen extends StatefulWidget {
  EmailVerificationScreen({required this.name, Key? key}) : super(key: key);
  String? name;

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  final auth = FirebaseAuth.instance;
  User? user = FirebaseAuth.instance.currentUser;
  late Timer timer;
  Timer? resendtimer;
  bool canResendEmail = true;
  int resendTime = 60;

  resendEmailLink() async {
    bool emailSent = await sendVerificationEmail(context);
    if (emailSent) {
      setState(() {
        canResendEmail = false;
      });
      const oneSec = Duration(seconds: 1);
      resendtimer = Timer.periodic(oneSec, (timer) {
        if (resendTime == 0) {
          setState(() {
            timer.cancel();
            canResendEmail = true;
            resendTime = 60;
          });
        } else {
          setState(() {
            resendTime--;
          });
        }
      });
    }
  }

  userClickEmaiLinkOrNot() async {
    bool emailVerified = await checkEmailVerified();
    if (emailVerified) {
      // ignore: use_build_context_synchronously
      circleProgressDialog(context);
      timer.cancel();

      await saveUserName(documentID: (user?.email)!, name: (widget.name)!);

      await setSignInAsGoogleOrNot(false);
      // ignore: use_build_context_synchronously
      closeDialog(context);
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => TabBarController()));
    }
  }

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 3), (timer) async {
      await userClickEmaiLinkOrNot();
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
    resendtimer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Email Verification"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                  padding: EdgeInsets.only(bottom: 40),
                  child: Image(
                      width: 100,
                      height: 100,
                      image: AssetImage("assets/images/verification.png"))),
              Text(
                "An email has been sent to ${user?.email}\nplease verify",
                style: const TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              textForChangeEmail(context,
                  timer: timer,
                  resendtimer: resendtimer,
                  canResendEmail: canResendEmail),
              buttonWidget(
                  size: size,
                  topPadding: 30,
                  enable: canResendEmail,
                  text: "Resend Link",
                  onpressed: () async {
                    Fluttertoast.cancel();
                    circleProgressDialog(context);
                    if (await InternetConnectionChecker().hasConnection) {
                      await resendEmailLink();
                      // ignore: use_build_context_synchronously
                      closeDialog(context);
                    } else {
                      closeDialog(context);
                      Fluttertoast.showToast(msg: "No Internet Connection");
                    }
                  }),
              Text(
                canResendEmail
                    ? ""
                    : "For resend email wait for $resendTime seconds",
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
