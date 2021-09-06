import 'package:flutter/material.dart';
class InformationScreen extends StatelessWidget {
  final String userName;
  final String age;
  const InformationScreen({Key? key, required this.userName, required this.age}) : super(key: key);

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
              userNameContent: userName,
              ageContent: age),
        ),

      ),
    );
  }

  Widget informationWidget({ required String userNameContent, required String ageContent })
  {
    return Container(
      padding: const EdgeInsets.only(left: 20, top: 15, right: 20),
      child: Card(
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Text("Thông tin"),
              SizedBox(height: 10,),
              textWidget(labelText: "Họ và tên: ", content: userNameContent),
              SizedBox(height: 10,),
              textWidget(labelText: "Tuổi: ", content: ageContent),

            ],
          ),
        ),
      ),
    );
  }

  textWidget({required String labelText, required String content}){
    return Container(
      child: Row(
        children: [
          Text(labelText, style: TextStyle(fontWeight: FontWeight.bold),),
          Text(content)
        ],
      ),
    );
  }
}
