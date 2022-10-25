import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

onGotoWebsite({required String codeValue}) async {
  if (codeValue.isEmpty) {
    Fluttertoast.cancel();
    Fluttertoast.showToast(msg: "No Text Found");
    return;
  }
  Uri uriCode = Uri.parse(codeValue);
  try {
    if (!await launchUrl(uriCode, mode: LaunchMode.externalApplication)) {
      Fluttertoast.showToast(msg: "Could not launch URL");
    }
  } catch (e) {
    Fluttertoast.showToast(msg: "Could not launch URL");
  }
}
