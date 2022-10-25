import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qrcode_scanner/views/create_code_view.dart';
import 'package:qrcode_scanner/views/scan_code_view.dart';

class HomeController extends GetxController {
  List<Widget> views = [ScanCodeView(), CreateCodeView()];
  RxInt viewCurrentIndex = 0.obs;
}
