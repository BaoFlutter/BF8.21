import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widget_flutter/resources/widgets/common_widget.dart';
import 'package:widget_flutter/views/information_from_controller.dart';
class InformationScreen extends StatelessWidget {
  final String userName;
  final String age;
  const InformationScreen({Key? key, required this.userName, required this.age}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Information"),
        actions: [
          IconButton(
              onPressed: (){
                Get.to(InformationFromController());
              },
              icon: Icon(Icons.ac_unit_sharp))
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: informationWidget(
              userNameContent: userName,
              ageContent: age),
        ),

      ),
    );
  }


}
