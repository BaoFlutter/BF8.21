import 'package:api_code/data_sources/api_services.dart';
import 'package:api_code/models/video_model.dart';

import 'package:api_code/resources/strings.dart';
import 'package:api_code/view_models/video_list_provider.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class VideoListScreen extends StatefulWidget {
  const VideoListScreen({Key? key}) : super(key: key);

  @override
  _VideoListScreenState createState() => _VideoListScreenState();
}

class _VideoListScreenState extends State<VideoListScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<VideoListProvider>(context, listen: false).getVideoList();
  }

  @override
  Widget build(BuildContext context) {
 final videoListonProvider = Provider.of<VideoListProvider>(context) ;
    return Scaffold(
        appBar: AppBar(
          title: Text(VIDEO_LIST),
          centerTitle: true,

        ),
        body: Container(
          height: Get.height,
          width: Get.width,
          child: videoListonProvider.videoList.length!=0 ?
          GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: videoListonProvider.videoList.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  child: Card(
                      color: Colors.amber,
                      child: Column(
                        children: [
                          Image.network(videoListonProvider.videoList[index].url_photo!),
                          Text(videoListonProvider.videoList[index].title!, softWrap: true,)
                        ],
                      )
                  ),

                );
              }
          ):
              Center(
                child: CircularProgressIndicator()
              )
        )

    );
  }
}



