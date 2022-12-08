import 'package:flutter/material.dart';

import '../ui/styles/styles.dart';
import '../utils/helper.dart';

class UploadButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback buttonAction;
  const UploadButton({
    Key? key,
    required this.buttonAction,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      padding: EdgeInsets.only(top: 12, bottom: 12),
      decoration: BoxDecoration(
          border: Border.all(
            color: Color(Helper.getHexToInt('#263238')),
          ),
          borderRadius: BorderRadius.circular(7)),
      child: Stack(
clipBehavior: Clip.none,
children: [
        Center(
            child: InkWell(
                onTap: buttonAction,
                child: Text(
                  buttonText,
                  style:
                      AppStyles.getTextStyle(14.0, FontWeight.w600, 0xff263238),
                ))),
        Positioned(
            right: 12,
            child: Icon(
              Icons.cancel,
              color: Color(Helper.getHexToInt('#D1D1D1')),
            ))
      ]),
    );
  }
}
