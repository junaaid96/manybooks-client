import 'package:flutter/material.dart';
import 'package:googleapis/docs/v1.dart';
import 'package:manybooks_v2/data/storydata.dart';
import 'package:manybooks_v2/widgets/view_story.dart';
import 'package:one_context/one_context.dart';

import '../ui/styles/styles.dart';

Widget StoryButton(String image, name, BuildContext context) {
  return Column(children: [
    InkWell(
        borderRadius: BorderRadius.circular(50.0),
        onTap: () {
          OneContext().push(MaterialPageRoute(
              builder: (_) => ViewStory(
                    storylink: image,
                  )));
        },
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: Colors.grey),
            borderRadius: BorderRadius.circular(50.0),

            // border: Border.all(color: Colors.transparent, width: 2.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  image: DecorationImage(
                      image: NetworkImage(image), fit: BoxFit.cover)),
            ),
          ),
        )),
    SizedBox(
      height: 2,
    ),
    Text(
      name,
      style: AppStyles.getTextStyle(8.0, FontWeight.w600, 0xff263238),
    )
  ]);
}
