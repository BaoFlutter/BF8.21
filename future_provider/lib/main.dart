import 'package:api_code/data_sources/api_services.dart';
import 'package:api_code/views/second_video_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'models/video_model.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureProvider<List<VideoModel>>(
        create: (context) => ApiServices().fetchVideoList(),
        initialData: [],
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          home: SecondVideoListScreen(),
        ),

    );

  }
}

