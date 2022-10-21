import 'package:chewie/chewie.dart';
import 'package:education/controllers/category_detail/category_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:video_player/video_player.dart';

class CourseDetails extends StatelessWidget {
  CourseDetails({Key? key, required this.controller, required this.index})
      : super(key: key);
  CategroyDetailController controller;
  int index;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
            height: size.height * 0.2,
            width: size.width * 0.8,
            child: Chewie(
                controller: ChewieController(
              autoPlay: true,
              videoPlayerController:
                  VideoPlayerController.network(controller.data[index].video!),
            )),
          )
        ],
      ),
    );
  }
}
