import 'package:api_code/blocs/video_list_bloc.dart';
import 'package:api_code/data_sources/api_services.dart';
import 'package:api_code/models/video_model.dart';
import 'package:api_code/resources/strings.dart';
import 'package:api_code/views/video_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class VideoListScreen extends StatefulWidget {
  const VideoListScreen({Key? key}) : super(key: key);

  @override
  _VideoListScreenState createState() => _VideoListScreenState();
}

class _VideoListScreenState extends State<VideoListScreen> {

  final videoListBloc = VideoListBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    videoListBloc.putVideoListIntoBloc();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    videoListBloc.dispose();

  }


    @override
    Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar(
            title: Text(VIDEO_LIST),
            centerTitle: true,
          ),
          body: Container(
            height: Get.height,
            width: Get.width,
            child: StreamBuilder<List<VideoModel>>(
              stream: videoListBloc.videoListStream,
              builder: (context, snapshot){
                if(snapshot.hasError) return Center(
                  child: Text(ERROR_DATA_LOADING),
                );
                if(!snapshot.hasData) return Center(
                  child: CircularProgressIndicator(),
                );
                List<VideoModel> videoList = snapshot.data!;
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


