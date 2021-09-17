import 'package:flutter/material.dart';

Widget confirmationButton({required onPressed, required String lableButton }){
  return ElevatedButton(
      onPressed: onPressed,
      child: Text(lableButton));
}
