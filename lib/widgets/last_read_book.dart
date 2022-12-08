import 'package:flutter/material.dart';
import 'package:manybooks_v2/screens/book_details_screen.dart';
import 'package:manybooks_v2/screens/search_screen.dart';
import 'package:one_context/one_context.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../ui/styles/styles.dart';

class LastReadBook extends StatelessWidget {
  String lastReadBookCover,
      lastReadBookTitle,
      lastReadBookPages,
      chapterNo,
      chapterName;
  LastReadBook(
      {this.lastReadBookCover = "asset/images/books/creative-business.png",
      this.lastReadBookTitle = "Creative\nBUSINESS STARTUP",
      this.lastReadBookPages = "32% ( 64/200 Pages )",
      this.chapterNo = "Chapter Two",
      this.chapterName = "StartUp Plan"});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // OneContext().pushNamed('/bookDetails', arguments: {lastReadBookCover,lastReadBookTitle});
        OneContext().push(MaterialPageRoute(
            builder: (_) => BookDetails(
                  image: lastReadBookCover,
                  bookTitle: lastReadBookTitle,
                )));
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 10,  bottom: 10),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Card(
                margin: EdgeInsets.zero,
                elevation: 3,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.asset(
                      fit: BoxFit.cover,
                      height: 160,
                      width: 140,
                      lastReadBookCover),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: SizedBox(
                height: 140,
                width: double.infinity,
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 20.0, top: 10, bottom: 14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Text(
                        lastReadBookTitle,
                        style: AppStyles.bookTitleStyle,
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(lastReadBookPages,
                          style: AppStyles.bookPageReadStyle),
                      LinearPercentIndicator(
                        lineHeight: 5,
                        barRadius: Radius.circular(3),
                        padding: EdgeInsets.zero,
                        backgroundColor: Color(0xffD9D9D9),
                        percent: 0.32,
                        progressColor: Color(0xff263238),
                      ),
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: "$chapterNo:",
                            style:
                                AppStyles.getChapterNameStyle(FontWeight.w700),
                          ),
                          TextSpan(
                            text: " $chapterName",
                            style:
                                AppStyles.getChapterNameStyle(FontWeight.w600),
                          )
                        ]),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
