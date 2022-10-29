import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qrcode_scanner/views/create_code_view.dart';
import 'package:qrcode_scanner/views/history_view.dart';
import 'package:qrcode_scanner/views/scan_code_view.dart';

class HomeController extends GetxController {
  List<Widget> views = [CreateCodeView(), ScanCodeView(), HistoryView()];
  RxInt viewCurrentIndex = 1.obs;
}
