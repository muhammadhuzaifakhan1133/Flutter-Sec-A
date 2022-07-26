import 'package:ecommerce/constants/colors.dart';
import 'package:ecommerce/functions/firebase.dart';
import 'package:ecommerce/screens/product_screen/image_slider.dart';
import 'package:ecommerce/screens/product_screen/info.dart';
import 'package:ecommerce/screens/product_screen/render_slide_img.dart';
import 'package:ecommerce/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';

class ProductScreen extends StatefulWidget {
  ProductScreen(
      {required this.imgPaths,
      required this.isUserWishListProduct,
      required this.email,
      required this.productID,
      required this.materialsInfo,
      required this.washInstruction,
      required this.price,
      Key? key})
      : super(key: key);
  List<dynamic> imgPaths;
  String email;
  String productID;
  bool isUserWishListProduct;
  String materialsInfo;
  String washInstruction;
  double price;
  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: buttonWidget(
          buttonColor: themeColor,
          size: size,
          text: "Add to Bag",
          onpressed: () {},
          radius: 5,
          heightPercent: 0.08,
          widthPercent: 0.5),
      body: Column(
        children: [
          imageSlider(
              context: context,
              imgPaths: widget.imgPaths,
              isUserWishListProduct: widget.isUserWishListProduct,
              onPressedFavoriteIcon: () {
                if (widget.isUserWishListProduct) {
                  removeFromUserWishList(
                      email: widget.email, productID: widget.productID);
                  setState(() {
                    widget.isUserWishListProduct = false;
                  });
                } else {
                  addToUserWishList(
                      email: widget.email, productID: widget.productID);
                  setState(() {
                    widget.isUserWishListProduct = true;
                  });
                }
              }),
          TabBar(
            controller: _tabController,
            indicatorColor: themeColor,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            tabs: const [
              Tab(text: "INFO"),
              Tab(
                text: "MEASUREMENTS",
              )
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                ProductInfo(
                    materialInfo: widget.materialsInfo,
                    washInstruction: widget.washInstruction),
                const Center(
                  child: Text("Measuremens"),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
