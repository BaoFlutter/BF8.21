
import 'package:api_code/data_sources/repository.dart';
import 'package:api_code/models/video_model.dart';
import 'package:rxdart/rxdart.dart';

class VideoListBloc{

  final _repository = Repository();

  final videoListSubject = PublishSubject<List<VideoModel>>();

  // put Data into Bloc
 putVideoListIntoBloc() async {
   List<VideoModel> videoList = await _repository.fetchAllVideos();
   videoListSubject.sink.add(videoList);
 }
 // get Data Stream to View
 Stream<List<VideoModel>> get videoListStream => videoListSubject.stream;

 dispose(){
   videoListSubject.close();
 }





}