import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:manybooks_v2/screens/book_details_screen.dart';
import 'package:manybooks_v2/screens/recentsearchbookslist.dart';
import 'package:manybooks_v2/widgets/book_details.dart';
import 'package:one_context/one_context.dart';

import '../screens/booklist.dart';

class SmallBookPart extends StatelessWidget {
  String id;
  String type;
  String image;
  String writer;
  String title;

  SmallBookPart(
      {this.id = "632984c21c67cc8eaf26fe36",
      this.type = "Books",
      this.image =
          "https://template.canva.com/EADaopxBna4/1/0/251w-ujD6UPGa9hw.jpg",
      this.title = "Unleash The Dragon",
      this.writer = "Robby E. Pearson"});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, right: 10, left: 10),
      child: SizedBox(
          height: 170,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  print(id);
                  OneContext().push(MaterialPageRoute(
                      builder: (_) => BookDetails(
                            likes: 35,
                            dislikes: 07,
                            shares: 03,
                            image: image,
                            bookTitle: title,
                            bookWriter: writer,
                          )));
                },
                child: Container(
                  height: 134,
                  width: 100,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(3),
                      child: Image.network(
                        image,
                        fit: BoxFit.cover,
                        alignment: Alignment(0, 0.30),
                      )),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 2),
                width: 100,
                child: Text(
                  title,
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                      color: Color(0xff263238)),
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                ),
              ),
              SizedBox(
                width: 100,
                child: Text(
                  writer,
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 11,
                      color: Color(0xff263238)),
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                ),
              )
            ],
          )),
    );
  }
}
