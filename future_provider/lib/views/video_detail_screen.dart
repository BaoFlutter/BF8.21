import 'package:api_code/models/video_model.dart';
import 'package:api_code/resources/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class VideoDetailScreen extends StatelessWidget {
  final VideoModel videoModel;
  const VideoDetailScreen({Key? key, required this.videoModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(VIDEO_DETAIL),
        centerTitle: true,
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.network(videoModel.url_photo!),
            Text(videoModel.title!, style: TextStyle(fontWeight: FontWeight.bold),),
            Text(videoModel.description!, softWrap: true,)
          ],
        ),
      ),
    );
  }
}
