import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_louoj/views/signin/signin_cards.dart/designer_card.dart';
import 'package:login_louoj/views/signin/signin_cards.dart/fabric_card.dart';
import 'package:login_louoj/views/signin/signin_cards.dart/factory_card.dart';
import 'package:login_louoj/views/signin/signin_cards.dart/stylist_card.dart';

class SigninController extends GetxController {
  RxInt card_no = 0.obs;
  List<Widget> cards = [
    FabricCard(),
    DesignerCard(),
    FactoryCard(),
    StylistCard()
  ];
}
