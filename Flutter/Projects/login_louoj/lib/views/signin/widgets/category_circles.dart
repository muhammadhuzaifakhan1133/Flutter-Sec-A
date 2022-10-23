import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_louoj/controller/signin/signin_controller.dart';
import 'package:login_louoj/widgets/category_circle.dart';

class CategoryCircles extends StatelessWidget {
  CategoryCircles({Key? key}) : super(key: key);

  double circleAndTextGap = 10;
  TextStyle textStyle = const TextStyle(color: Colors.white);

  @override
  Widget build(BuildContext context) {
    SigninController controller = Get.find(tag: "signin");
    return Obx(() => Column(
          children: [
            SizedBox(height: Get.height * 0.08),
            Wrap(
              direction: Axis.vertical,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 30,
              children: [
                categoryCircle(
                  imagePath: "assets/images/fabric_icon.png",
                  circleAndTextGap: circleAndTextGap,
                  label: "Fabric",
                  color: controller.card_no == 0 ? Colors.blue : Colors.white,
                  textStyle: textStyle,
                  onTapCategory: () {
                    controller.card_no.value = 0;
                  },
                ),
                categoryCircle(
                  imagePath: "assets/images/designer_icon.png",
                  circleAndTextGap: circleAndTextGap,
                  label: "Designer",
                  color: controller.card_no == 1 ? Colors.blue : Colors.white,
                  textStyle: textStyle,
                  onTapCategory: () {
                    controller.card_no.value = 1;
                  },
                ),
                categoryCircle(
                  imagePath: "assets/images/factory_icon.png",
                  circleAndTextGap: circleAndTextGap,
                  label: "Factory",
                  color: controller.card_no == 2 ? Colors.blue : Colors.white,
                  textStyle: textStyle,
                  onTapCategory: () {
                    controller.card_no.value = 2;
                  },
                ),
                categoryCircle(
                  imagePath: "assets/images/stylist_icon.png",
                  circleAndTextGap: circleAndTextGap,
                  label: "Stylist",
                  color: controller.card_no == 3 ? Colors.blue : Colors.white,
                  textStyle: textStyle,
                  onTapCategory: () {
                    controller.card_no.value = 3;
                  },
                ),
              ],
            ),
          ],
        ));
  }
}
