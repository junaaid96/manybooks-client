import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:googleapis/docs/v1.dart';
import 'package:manybooks_v2/data/storydata.dart';
import 'package:manybooks_v2/models/db_models/story_model.dart';
import 'package:manybooks_v2/screens/story_screen.dart';
import 'package:manybooks_v2/utils/api_callings.dart';
import 'package:manybooks_v2/widgets/view_story.dart';
import 'package:one_context/one_context.dart';

import '../models/states/stb.dart';
import '../ui/styles/styles.dart';

Widget AddStoryButton(String image, String name, BuildContext context) {
  PlatformFile? pickedFile;
  FilePickerResult? result;
  Future selectFile(context) async {
    result = await FilePicker.platform.pickFiles();
    if (result != null) {
      pickedFile = result!.files.first;
      // print(pickedFile!.name);
    } else {
      print("not uploaded");
    }
  }

  return Row(
    children: [
      Column(children: [
        Container(
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
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      color: Colors.white),
                  child: InkWell(
                    onTap: () async {
                      await selectFile(context);
                      // print(pickedFile);
                      print(pickedFile!.path.toString());
                      String imagePath = pickedFile!.path.toString();
                      String imgURL =
                          await ApiCalling().uploadToImgbb(imagePath);
                      await ApiCalling.createStories(imgURL);
                      var stories = await ApiCalling.getStories();
                      stbs.state.setStories(stories);
                      // Navigator.pop(context);
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.add,
                        color: Colors.blueGrey,
                        size: 25,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 2,
        ),
        Text(
          "You",
          style: AppStyles.getTextStyle(8.0, FontWeight.w600, 0xff263238),
        )
      ]),
      SizedBox(
        width: 20,
      )
    ],
  );
}
