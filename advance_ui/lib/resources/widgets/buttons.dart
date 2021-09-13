import 'package:advance_ui/resources/widgets/icon_text_button.dart';
import 'package:flutter/material.dart';
class Buttons extends StatelessWidget {
  const Buttons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20),
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: IconTextButton(
                iconData: Icons.call,
                text: "call",
                color: Colors.blue,
                onPressed: (){
                  print("Calling");
                },
              ) ),
          Expanded(
              flex: 1,
              child: IconTextButton(
                iconData: Icons.navigation,
                text: "route",
                color: Colors.blue,
                onPressed: (){
                  print("Routing");
                },
              ) ),
          Expanded(
              flex: 1,
              child: IconTextButton(
                iconData: Icons.share,
                text: "share",
                color: Colors.blue,
                onPressed: (){
                  print("Sharing");
                },
              ) ),
        ],
      ),
    );
  }
}
