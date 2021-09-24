import 'package:api_code/models/video_model.dart';
import 'package:flutter/material.dart';

class VideoListProvider with ChangeNotifier{
  List<VideoModel> videoList = [];

  updateVideoList({ required videoList}){
    this.videoList = videoList;
    notifyListeners();
  }


}