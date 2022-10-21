import 'package:education/controllers/category_detail/category_details_controller.dart';
import 'package:education/models/category_detail/category_details_model.dart';
import 'package:education/services/category_details/category_details_services.dart';
import 'package:education/widgets.dart/back_button.dart';
import 'package:education/widgets.dart/course_tile.dart';
import 'package:flutter/material.dart';

class CategroyDetail extends StatelessWidget {
  CategroyDetail({Key? key, required this.course}) : super(key: key);
  String course;

  @override
  Widget build(BuildContext context) {
    CategroyDetailController controller = CategroyDetailController();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 30),
          Row(
            children: [
              backbutton(),
              SizedBox(width: 20),
              Text(
                "${course}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              )
            ],
          ),
          SizedBox(height: 10),
          Expanded(
              child: FutureBuilder(
            future: getCategroyDetails(course),
            builder: (BuildContext context,
                AsyncSnapshot<CategroyDetailsModel> snapshot) {
              if (snapshot.data != null) {
                controller.data.value = snapshot.data!.data!;
                print(controller.data.value);
                return ListView.builder(
                  itemCount: controller.data.value.length,
                  itemBuilder: (BuildContext context, int index) {
                    return courseTile(controller, index);
                  },
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ))
        ],
      ),
    );
  }
}
