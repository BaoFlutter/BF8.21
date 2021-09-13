import 'package:flutter/material.dart';
class TextWidget extends StatelessWidget {
  final String labelText;
  final String content;

  const TextWidget({Key? key, required this.labelText, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
