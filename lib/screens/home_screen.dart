import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manybooks_v2/screens/story_screen.dart';
import 'package:manybooks_v2/widgets/last_read_book.dart';
import 'package:manybooks_v2/widgets/small_book_part.dart';
import 'package:one_context/one_context.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:manybooks_v2/data/storydata.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../utils/storybtn.dart';
import 'book_details_screen.dart';

class HomeScreen extends StatelessWidget {
  final String lastReadBookCover = "asset/images/books/creative-business.png";
  final String lastReadBookTitle = "Creative\nBUSINESS STARTUP";
  final String lastReadBookPages = "32% ( 64/200 Pages )";
  final String chapterNo = "Chapter Two";
  final String chapterName = "StartUp Plan";

  // HomeScreen({Future? books});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(top: 20),
      scrollDirection: Axis.vertical,
      child: Column(children: [
        StoryScreen(),
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: LastReadBook(
              lastReadBookCover: lastReadBookCover,
              chapterNo: chapterNo,
              chapterName: chapterName,
              lastReadBookTitle: lastReadBookTitle,
              lastReadBookPages: lastReadBookPages),
        ),
        Container(
          alignment: Alignment.center,
          child: GridView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: 190,
                crossAxisCount: 3,
                childAspectRatio: 5.5 / 10,
              ),
              itemCount: 8,
              itemBuilder: (BuildContext context, int index) {
                return SmallBookPart();
              }),
        ),
      ]),
    );
  }
}
