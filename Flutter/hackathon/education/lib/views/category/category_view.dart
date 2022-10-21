import 'package:education/controllers/category/category_controller.dart';
import 'package:education/models/category/category_model.dart';
import 'package:education/services/category/category_service.dart';
import 'package:education/widgets.dart/back_button.dart';
import 'package:education/widgets.dart/category_card.dart';
import 'package:flutter/material.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CategoryController controller = CategoryController();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          SizedBox(height: 20),
          Row(
            children: [
              backbutton(),
              SizedBox(width: 20),
              Text(
                "Continue Your Lessons",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              )
            ],
          ),
          SizedBox(height: 10),
          Expanded(
            child: FutureBuilder(
              future: getServices(),
              builder: (BuildContext context,
                  AsyncSnapshot<CategoryModel> snapshot) {
                if (snapshot.data != null) {
                  controller.categories.value = snapshot.data!.data!;
                  return ListView.separated(
                    itemCount: controller.categories.value.length,
                    itemBuilder: (context, index) {
                      return categoryCard(
                          size: size,
                          title:
                              controller.categories.value[index].categories!);
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(height: 20);
                    },
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ],
      ),
    ));
  }
}
