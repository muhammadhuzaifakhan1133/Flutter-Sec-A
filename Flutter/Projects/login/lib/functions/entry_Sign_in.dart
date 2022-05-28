Entry_Sign_in(emailController, passController) {
  String dbemail = "huzaifaacademy11@gmail.com";
  String dbpass = "1234567890";
  bool corrEmail = (emailController.text == dbemail);
  bool corrPass = (passController.text == dbpass);
  if ((corrEmail) && (corrPass)) {
    print("Access");
  } else {
    print("Acess Denied");
  }
  if (!(corrEmail)) {
    print("Invalid Email");
  }
  if (!(corrPass)) {
    print("Invalid Password");
  }
}
