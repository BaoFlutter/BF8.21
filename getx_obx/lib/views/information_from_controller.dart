import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widget_flutter/controllers/information_controller.dart';
import 'package:widget_flutter/resources/widgets/common_widget.dart';
class InformationFromController extends StatelessWidget {
  InformationFromController({Key? key}) : super(key: key);

  final informationController = Get.put(InformationController()) ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Information"),

      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: informationWidget(
              userNameContent: informationController.userName.value,
              ageContent: informationController.age.value),
        ),


      ),
    );
  }
}
