import 'package:education/views/category_details/category_details_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Container categoryCard(
    {required Size size, String title = "Basic UI/UX Designer"}) {
  return Container(
    width: size.width * 0.85,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: Colors.blue, width: 3),
      gradient: const LinearGradient(
        colors: [Colors.teal, Colors.white],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Ongoing . 42/50",
                  style: TextStyle(color: Colors.white, fontSize: 15)),
              Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              const Text("by Azamat baimatov",
                  style: TextStyle(color: Colors.white, fontSize: 15)),
              const SizedBox(height: 5),
              ElevatedButton(
                  onPressed: () {
                    Get.to(CategroyDetail(course: title));
                  },
                  child: Text("Continue"),
                  style: ElevatedButton.styleFrom(primary: Colors.blue[900]))
            ],
          ),
          CircularProgressIndicator(
            value: 0.7,
            strokeWidth: 9,
            backgroundColor: Colors.grey,
            color: Colors.blue[900],
          )
        ],
      ),
    ),
  );
}
