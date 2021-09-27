import 'package:api_code/data_sources/api_urls.dart';
import 'package:api_code/models/video_model.dart';
import 'package:api_code/resources/strings.dart';
import 'package:api_code/resources/utils/logs.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as json;

class ApiServices {
  // fetch all videos

  Future<List<VideoModel>> fetchVideoList() async {
    List<VideoModel> videoList = [];
    var videoListUrl = ApiUrls.VIDEO_URL;
    var response;
    // http,
    try{
      response = await http.get(videoListUrl);
    }
    catch(e)
    {
      print(ERROR_DOWNLOADING);
    }
    var body = json.jsonDecode(response.body);
    Log().printJson(json: body);
    if(body['code'] == 'success'){
      List jsonList = body['list'];
      for(var json in jsonList){
        VideoModel videoModel = VideoModel.fromJson(json);
        videoList.add(videoModel);
      }
    }
    return videoList;
  }

}