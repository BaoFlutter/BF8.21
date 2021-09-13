import 'package:flutter/material.dart';
class TextInputWidget extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextEditingController controller;
  TextInputWidget({required this.labelText, required this.hintText, required this.controller });

  @override
  Widget build(BuildContext context) {
   return Container(
        padding: const EdgeInsets.only(left: 20, top: 15, right: 20),
        child: TextField(
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: labelText,
              hintText: hintText
          ),
          controller: controller,
        )
    );
  }
}
