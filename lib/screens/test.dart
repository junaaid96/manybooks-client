import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:manybooks_v2/widgets/book_details.dart';
import 'package:one_context/one_context.dart';
import '../screens/booklist.dart';

class SingleSmallBookItem extends StatelessWidget {
  String image;
  String writer;
  String title;

  SingleSmallBookItem(
      {this.image = "asset/images/books/creative-business.png",
      this.title = "Unleash The Dragon",
      this.writer = "Robby E. Pearson"});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: 15,
          ),
          SizedBox(
              height: 180,
              child: SizedBox(
                height: 170,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(bottom: 2),
                      height: 134,
                      width: 100,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(3),
                          child: Image.asset(
                            image,
                            fit: BoxFit.cover,
                            alignment: Alignment(0, 0.30),
                          )),
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
                ),
              ))
        ]),
      ),
    );
  }
}
// ListView.builder(
//                 shrinkWrap: true,
//                 physics: NeverScrollableScrollPhysics(),
//                 scrollDirection: Axis.horizontal,
//                 itemCount: 3,
//                 itemBuilder: (BuildContext context, int index) {
//                   return 
// Padding(
//                     padding: const EdgeInsets.only(right: 15),
//                     child: Container(
//                       height: 170,
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Container(
//                             padding: EdgeInsets.only(bottom: 2),
//                             height: 134,
//                             width: 100,
//                             child: ClipRRect(
//                                 borderRadius: BorderRadius.circular(3),
//                                 child: Image.network(
//                                   image,
//                                   fit: BoxFit.cover,
//                                   alignment: Alignment(0, 0.30),
//                                 )),
//                           ),
//                           Container(
//                             padding: EdgeInsets.symmetric(vertical: 2),
//                             width: 100,
//                             child: Text(
//                               title,
//                               style: TextStyle(
//                                   fontWeight: FontWeight.w700,
//                                   fontSize: 12,
//                                   color: Color(0xff263238)),
//                               overflow: TextOverflow.ellipsis,
//                               softWrap: false,
//                             ),
//                           ),
//                           Container(
//                             width: 100,
//                             child: Text(
//                               writer,
//                               style: TextStyle(
//                                   fontWeight: FontWeight.w400,
//                                   fontSize: 11,
//                                   color: Color(0xff263238)),
//                               overflow: TextOverflow.ellipsis,
//                               softWrap: false,
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                   );
//                 })),





              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Text(
              //       "type",
              //       style: TextStyle(
              //           fontSize: 16,
              //           fontWeight: FontWeight.w700,
              //           color: Color(0xff263238)),
              //     ),
              //     TextButton(
              //       style: TextButton.styleFrom(
              //         minimumSize: Size.zero,
              //         padding: EdgeInsets.zero,
              //         tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              //       ),
              //       onPressed: () {
              //         OneContext().push(MaterialPageRoute(
              //             builder: (_) => BookList(
              //                   type: "type",
              //                   image: image,
              //                   title: title,
              //                   writer: writer,
              //                 )));
              //       },
              //       child: Text(
              //         "More",
              //         style: TextStyle(
              //             fontSize: 16,
              //             color: Color(0xff4B9DA8),
              //             fontWeight: FontWeight.w600),
              //       ),
              //     ),
              //   ],
              // ),