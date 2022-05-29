import 'package:login/functions/database_conn.dart';
import 'package:mysql1/mysql1.dart';

Entry_Sign_in(emailController, passController) async {
  var email = emailController.text;
  var pass = passController.text;
  var result = ((email == "huzaifa123@gmail.com") && (pass == "huzaifa123"));
  if (result) {
    print("Access successfully!");
  } else {
    print("Acess Denied!");
  }
}
