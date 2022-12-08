import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:one_context/one_context.dart';
import 'package:manybooks_v2/widgets/download.dart';
import 'package:manybooks_v2/ui/styles/styles.dart';
import 'package:manybooks_v2/widgets/book_details.dart';
import 'package:manybooks_v2/widgets/react_button.dart';

import '../widgets/appbar.dart';

class BookDetails extends StatelessWidget {
  final String? image;
  final String? bookTitle;
  final String? bookWriter;
  final String? bookDescription;
  final int likes;
  final int dislikes;
  final int shares;
  BookDetails(
      {this.image =
          "https://cdn.sanity.io/images/jykd2389/production/02058208a24fa84f109a262d02c5e28078690593-432x691.jpg?auto=format",
      this.bookTitle = "THE KING OF DRUGS",
      this.bookWriter = "Nora Barret",
      this.bookDescription =
          "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters.",
      this.likes = 31,
      this.dislikes = 25,
      this.shares = 05});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBarScreen(title: "MANYBOOKS"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BookDetailsWidget(
                image: image,
                bookTitle: bookTitle,
                bookWriter: bookWriter,
                bookDescription: bookDescription),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ReactButton("asset/icons/like.png", "Like", "${likes}"),
                      ReactButton(
                          "asset/icons/dislike.png", "Dislike", "${dislikes}"),
                      ReactButton(
                          "asset/icons/share.png", "Share", "${shares}"),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  ListTile(
                    minVerticalPadding: 0.5,
                    horizontalTitleGap: 8.0,
                    leading: CircleAvatar(
                      backgroundImage: AssetImage("asset/icons/Ellipse.png"),
                    ),
                    title: Padding(
                      padding: const EdgeInsets.only(top: 13.0),
                      child: Text(
                        "Sam Barker",
                        style: AppStyles.getTextStyle(
                            13.0, FontWeight.w600, 0xff263238),
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(bottom: 17.0),
                      child: Text(
                        "2 Days ago",
                        style: AppStyles.getTextStyle(
                            10.0, FontWeight.w600, 0xff858383),
                      ),
                    ),

                    trailing: Padding(
                      padding: EdgeInsets.only(bottom: 17),
                      child: RatingBar(
                        initialRating: 3.5,
                        unratedColor: Color(0xff263238),
                        itemSize: 15,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        ratingWidget: RatingWidget(
                          full: Icon(
                            Icons.star,
                            color: Color(0xff4AE800),
                          ),
                          half: Icon(
                            Icons.star_half,
                            color: Color(0xff4AE800),
                          ),
                          empty: Icon(Icons.star_border_outlined),
                        ),
                        itemPadding: EdgeInsets.symmetric(horizontal: 0.5),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                    ),
                    // trailing: RatingBar.builder(

                    //   itemSize: 15,
                    //   unratedColor: Color(0xff263238),
                    //   initialRating: 4,
                    //   minRating: 1,
                    //   direction: Axis.horizontal,
                    //   allowHalfRating: true,
                    //   itemCount: 5,
                    //   itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                    //   itemBuilder: (context, _) => Icon(
                    //     Icons.star,
                    //     color: Color(0xff4AE800),
                    //   ),
                    //   onRatingUpdate: (rating) {
                    //     print(rating);
                    //   },
                    // ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 17),
                    child: Center(
                      child: Text(
                          "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.",
                          style: AppStyles.getTextStyle(
                              11.0, FontWeight.w400, 0xff263238),
                          textAlign: TextAlign.justify),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      OneContext().push(MaterialPageRoute(
                          builder: (_) => DownloadingDialog()));
                    },
                    child: Container(
                      padding: EdgeInsets.all(5),
                      height: 40,
                      width: 140,
                      decoration: BoxDecoration(
                          color: Color(0xff263238),
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                          child: Text("Read (10Pages)",
                              style: AppStyles.getTextStyle(
                                  12.0, FontWeight.w700, 0xffFFFFFF))),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
