import 'package:api_code/providers/video_list_provider.dart';
import 'package:api_code/resources/strings.dart';
import 'package:api_code/views/video_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class SecondVideoListScreen extends StatelessWidget {
  const SecondVideoListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   // final videoList = context.watch<VideoListProvider>().videoList;
   // final videoListProvider = Provider.of<VideoListProvider>(context);
    //final videoList = videoListProvider.videoList;
    return Scaffold(
      appBar: AppBar(
        title: Text(VIDEO_LIST),
        centerTitle: true,
      ),

      body: Container(
        height: Get.height,
        width: Get.width,
        /*
        child: GridView.builder(
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
        ),

         */
        child: Consumer<VideoListProvider>(
          builder: (context, videoListProvider, child){
            final videoList = videoListProvider.videoList;
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
          child: Container(),
        ),

      ),
    );
  }
}
