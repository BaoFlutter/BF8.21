import 'package:flutter/material.dart';
import 'package:widget_flutter/resources/widgets/text_widget.dart';
class InformationWidget extends StatelessWidget {
  final String userNameContent;
  final String ageContent;

  const InformationWidget({Key? key, required this.userNameContent, required this.ageContent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, top: 15, right: 20),
      child: Card(
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Text("Thông tin"),
              const SizedBox(height: 10,),
              TextWidget(labelText: "Họ và tên: ", content: userNameContent),
              const SizedBox(height: 10,),
              TextWidget(labelText: "Tuổi: ", content: ageContent),

            ],
          ),
        ),
      ),
    );
  }
}
