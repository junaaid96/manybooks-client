import 'package:flutter/material.dart';
import 'package:manybooks_v2/ui/styles/styles.dart';

import '../utils/helper.dart';

class UploadForm extends StatelessWidget {
  final String labelText;
  final String hintText;
  const UploadForm({Key? key, required this.hintText, required this.labelText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labelText,
            style: AppStyles.getTextStyle(12.0, FontWeight.w600, 0xff263238),
          ),
          SizedBox(height: 6),
          Container(
            height: 40,
            decoration:
                BoxDecoration(color: Color(Helper.getHexToInt('#EFEFEF'))),
            child: TextField(
              decoration: InputDecoration(
                // labelText: 'Your book name here',
                fillColor: Color(Helper.getHexToInt('#EFEFEF')),
                hintText: hintText,
                hintStyle:
                    AppStyles.getTextStyle(11.0, FontWeight.w500, 0xffACABAB),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
