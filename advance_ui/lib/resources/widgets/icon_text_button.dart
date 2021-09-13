import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class IconTextButton extends StatelessWidget {
  final IconData iconData;
  final String text;
  final Color color;
  final onPressed ;
  const IconTextButton({Key? key, required this.iconData, required this.text,required this.color, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: Column(
          children: [
            Icon(iconData, color: color,),
            const SizedBox(height: 10,),
            Text(text.toUpperCase(), style: TextStyle(color: color, fontWeight: FontWeight.bold),)
          ],
        ),
      ),
      onTap: onPressed
    );
  }
}
