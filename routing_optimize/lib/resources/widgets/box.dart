import 'package:flutter/material.dart';
class Box extends StatelessWidget {
  const Box({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Widget Box được build") ;
    return SizedBox(
      height: 50,
    );
  }
}
