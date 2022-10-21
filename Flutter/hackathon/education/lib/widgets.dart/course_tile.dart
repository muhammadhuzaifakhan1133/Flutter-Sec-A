import 'package:education/controllers/category_detail/category_details_controller.dart';
import 'package:education/views/course_details/course_details_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget courseTile(CategroyDetailController controller, int index) {
  return InkWell(
    onTap: () {
      Get.to(CourseDetails(controller: controller, index: index));
    },
    child: Card(
      child: ListTile(
          leading: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.grey[200],
              child: Center(
                  child: Icon(Icons.video_collection_outlined,
                      color: Colors.black))),
          trailing: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.orange[200],
              child: Center(child: Icon(Icons.lock, color: Colors.orange))),
          title: Text("${controller.data[index].title}")),
    ),
  );
}
