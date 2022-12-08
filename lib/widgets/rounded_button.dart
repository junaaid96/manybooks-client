import 'package:flutter/material.dart';
import 'package:one_context/one_context.dart';

import '../utils/helper.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton(
      {this.backgroundColor = '#FFFFFF',
      this.textColor = '#263238',
      this.borderColor = '#263238',
      this.buttonText = 'Button',
      required this.buttonAction});

  String backgroundColor;
  String textColor;
  String borderColor;
  String buttonText;
  VoidCallback buttonAction;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: buttonAction,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          Color(
            Helper.getHexToInt(backgroundColor),
          ),
        ),
        elevation: MaterialStateProperty.all(0),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
            side: BorderSide(color: Color(Helper.getHexToInt(borderColor))),
          ),
        ),
      ),
      child: Text(
        "${buttonText}",
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700,color: Color(Helper.getHexToInt(textColor))),
      ),
    );
  }
}
