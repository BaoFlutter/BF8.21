import 'package:api_code/models/video_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VideoListController extends GetxController{
  List<VideoModel> videoList = [];

  updateVideoList({ required videoList}){
    this.videoList = videoList;
    update();
  }


}