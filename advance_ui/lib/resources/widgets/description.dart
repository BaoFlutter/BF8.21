import 'package:flutter/material.dart';
class Description extends StatelessWidget {
  final String text;
  const Description({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 15, right: 15),
      child: Text(text,
      softWrap: true,
      ),
    );
  }
}
