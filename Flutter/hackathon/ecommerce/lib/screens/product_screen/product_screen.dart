import 'package:ecommerce/constants/colors.dart';
import 'package:ecommerce/constants/values.dart';
import 'package:ecommerce/functions/firebase.dart';
import 'package:ecommerce/screens/product_screen/image_slider.dart';
import 'package:ecommerce/screens/product_screen/info/info.dart';
import 'package:ecommerce/screens/product_screen/measurements/cloth_measurements.dart';
import 'package:ecommerce/screens/product_screen/measurements/measurements.dart';
import 'package:ecommerce/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProductScreen extends StatefulWidget {
  ProductScreen(
      {required this.name,
      required this.imgPaths,
      required this.isUserWishListProduct,
      required this.email,
      required this.productID,
      required this.materialsInfo,
      required this.washInstruction,
      required this.price,
      Key? key})
      : super(key: key);
  String name;
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
  late List<bool> _colorsListSelected;
  ClothMeasurements clothMeasurements = ClothMeasurements();
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _colorsListSelected = List.generate(colorsList.length, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: buttonWidget(
          buttonColor: themeColor,
          size: size,
          text: "Add to Bag",
          onpressed: () {
            if (!(_colorsListSelected.contains(true))) {
              Fluttertoast.showToast(msg: "Select Color of dress");
              return;
            }
          },
          radius: 5,
          heightPercent: 0.08,
          widthPercent: 0.5),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
          Padding(
            padding: const EdgeInsets.only(top: 15.0, left: 10),
            child: Text(widget.name,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 10),
            child: Text("\$ ${widget.price}",
                style: TextStyle(color: themeColor, fontSize: 14)),
          ),
          TabBar(
            controller: _tabController,
            indicatorColor: themeColor,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            tabs: const [
              Tab(text: "INFO"),
              Tab(text: "MEASUREMENTS"),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                ProductInfo(
                    materialInfo: widget.materialsInfo,
                    washInstruction: widget.washInstruction),
                ProductMeasurements(
                  price: widget.price,
                  colorsListSelected: _colorsListSelected,
                  clothMeasurements: clothMeasurements,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
