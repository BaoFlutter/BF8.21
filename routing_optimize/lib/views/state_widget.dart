import 'package:flutter/material.dart';
import 'package:widget_flutter/resources/widgets/common_widget.dart';
import 'package:widget_flutter/resources/widgets/information_widget.dart';
class StateWidget extends StatefulWidget {
  final String userName ;
  final String age;

  const StateWidget({Key? key, required this.userName,required this.age}) : super(key: key);
  @override
  _StateWidgetState createState() => _StateWidgetState();
}

class _StateWidgetState extends State<StateWidget> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Information"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_outlined),
          onPressed: (){
            //Get.back();
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: InformationWidget(
              userNameContent: widget.userName,
              ageContent: widget.age),
        ),

      ),
    );
  }


}
