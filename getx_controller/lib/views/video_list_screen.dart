import 'package:api_code/controllers/video_list_controller.dart';
import 'package:api_code/data_sources/api_services.dart';
import 'package:api_code/models/video_model.dart';
import 'package:api_code/providers/video_list_provider.dart';
import 'package:api_code/resources/strings.dart';
import 'package:api_code/views/second_video_list_screen.dart';
import 'package:api_code/views/video_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class VideoListScreen extends StatelessWidget {
  const VideoListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(VIDEO_LIST),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: (){
                Get.to(SecondVideoListScreen());
              },
              icon: Icon(Icons.star, color: Colors.amberAccent,)),
          IconButton(
              onPressed: (){
                //Get.snackbar("Thông báo", "Đây là màn hình video list");
                Get.defaultDialog(title: "Thông báo", content: Text("Xin chào!"));
              },
              icon: Icon(Icons.ac_unit, color: Colors.white,))
        ],
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        child: FutureBuilder<List<VideoModel>>(
          future: ApiServices().fetchVideoList(),
          builder: (context, snapshot){
            if(snapshot.hasError) return Center(
              child: Text(ERROR_DATA_LOADING),
            );
            if(!snapshot.hasData) return Center(
              child: CircularProgressIndicator(),
            );
            List<VideoModel> videoList = snapshot.data!;

            Get.put(VideoListController()).updateVideoList(videoList: videoList);

            //context.read<VideoListProvider>().updateVideoList(videoList: videoList);

            return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemCount: videoList.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    child: Card(
                        color: Colors.amber,
                        child: Column(
                          children: [
                            Image.network(videoList[index].url_photo!),
                            Text(videoList[index].title!, softWrap: true,)
                          ],
                        )
                    ),
                    onTap: (){
                      Get.to(VideoDetailScreen(videoModel: videoList[index]));
                    },
                  );
                }
            );

          },
        ),
      )

    );
  }
}
