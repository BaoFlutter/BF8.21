import 'package:flutter/material.dart';
class LabelWidget extends StatelessWidget {
  const LabelWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 25, left: 20),
      child: Row(
        children: [
          Expanded(
              flex: 5,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Oscen Lake Campground", style: TextStyle(fontWeight: FontWeight.bold),),
                    Text("Kandersteg, Switzerland")
                  ],
                ),

              )),
          Expanded(
              flex: 1,
              child: Container(
                child: Row(
                  children: [
                    Icon(Icons.star,color: Colors.red,),
                    Text("41")
                  ],
                ),


              )),

        ],
      ),

    );
  }
}
