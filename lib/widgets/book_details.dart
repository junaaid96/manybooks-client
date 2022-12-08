import 'package:flutter/material.dart';

class BookDetailsWidget extends StatelessWidget {
  String? image, bookTitle, bookWriter, bookDescription;
  BookDetailsWidget(
      {this.image, this.bookTitle, this.bookWriter, this.bookDescription});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 210,
          child: Stack(
            // clipBehavior: Clip.hardEdge,
            children: [
              Column(
                children: [
                  Container(
                    height: 190,
                    width: double.infinity,
                    child:
// Image.network(
//                       image!,
//                       fit: BoxFit.cover,
//                       alignment: Alignment(0, -.55),
//                       // height: 170,
//                       // width: 500,
//                     )
                        Image.network(
                      image!,
                      fit: BoxFit.cover,
                      alignment: Alignment(0, -.55),
                    ),
                  ),
                ],
              ),
              Positioned(
                // top: 50,
                right: 0,
                left: 0,
                // bottom: -50,
                child: Container(
                  height: 200.0,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    begin: FractionalOffset.topCenter,
                    end: FractionalOffset.bottomCenter,
                    colors: [
                      Color(0xff386488).withOpacity(0.35),
                      Colors.white.withOpacity(0.995),
                    ],
                  )),
                ),
              ),
              Positioned(
                  top: 55,
                  right: 0,
                  left: 10,

                  // bottom: -70,
                  child: Column(children: [
                    Card(
                      elevation: 5,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child:
// Image.network(
//                           image!,
//                           height: 145,
//                           width: 100,
//                           fit: BoxFit.cover,
//                         ),
                            Image.network(
                          image!,
                          height: 145,
                          width: 100,
                          fit: BoxFit.cover,
                          alignment: Alignment(0, -.55),
                        ),
                      ),
                    ),
                  ])),
            ],
          ),
        ),
        Center(
          child: Text(
            bookTitle!,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Color(0xff263238)),
          ),
        ),
        SizedBox(
          height: 2,
        ),
        Center(
          child: Text(
            "by",
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xff263238)),
          ),
        ),
        Center(
          child: Text(
            bookWriter!,
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Color(0xff263238)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 24, right: 24, top: 4),
          child: Center(
            child: Text(bookDescription!,
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff263238)),
                textAlign: TextAlign.center),
          ),
        )
      ],
    );
  }
}
