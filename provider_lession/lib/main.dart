import 'package:api_code/providers/video_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'views/video_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context)=> VideoListProvider()),
      // Đặt thêm các provider
    ],
    child: GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: VideoListScreen(),
    ),
    );
  }
}

