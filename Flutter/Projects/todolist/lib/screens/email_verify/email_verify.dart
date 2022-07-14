import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:todolist/functions/firebase.dart';
import 'package:todolist/functions/save_sign_in_as_google.dart';
import 'package:todolist/screens/email_verify/text_for_change_email.dart';
import 'package:todolist/screens/home/home.dart';
import 'package:todolist/widgets/button.dart';
import 'package:todolist/widgets/loading_widget.dart';

class EmailVerification extends StatefulWidget {
  EmailVerification({required this.name, Key? key}) : super(key: key);
  String? name;

  @override
  State<EmailVerification> createState() => _EmailVerificationState();
}

class _EmailVerificationState extends State<EmailVerification> {
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

  UserClickEmaiLinkOrNot() async {
    bool emailVerified = await checkEmailVerified();
    if (emailVerified) {
      circleProgressDialog(context);
      timer.cancel();
      bool ifDocExist;
      try {
        ifDocExist = await checkIfDocExist(documentID: (user?.email)!);
      } catch (e) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.toString())));
        return;
      }
      if (!(ifDocExist)) {
        await saveUserName(documentID: (user?.email)!, name: (widget.name)!);
      }
      await setSignInAsGoogleOrNot(false);
      Navigator.of(context, rootNavigator: true)
          .pop(); // cancel progress dialog
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => Home(name: widget.name)),
          (route) => false);
    }
  }

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 3), (timer) async {
      await UserClickEmaiLinkOrNot();
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
              Padding(
                  padding: EdgeInsets.only(bottom: 40),
                  child: Image(
                      width: 100,
                      height: 100,
                      image:
                          AssetImage("assets/images/email_verification.png"))),
              Text(
                "An email has been sent to ${user?.email}\nplease verify",
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
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
                      Navigator.of(context, rootNavigator: true).pop();
                    } else {
                      Navigator.of(context, rootNavigator: true).pop();
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
