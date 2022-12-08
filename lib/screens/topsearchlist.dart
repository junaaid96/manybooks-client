// import 'package:flutter/material.dart';
// import 'package:manybooks_v2/models/db_models/book_model.dart';
// import 'package:manybooks_v2/models/states/stb.dart';
// import 'package:manybooks_v2/screens/book_details_screen.dart';
// import 'package:manybooks_v2/ui/styles/styles.dart';
// import 'package:manybooks_v2/utils/api_callings.dart';
// import 'package:manybooks_v2/widgets/appbar.dart';
// import 'package:one_context/one_context.dart';

// class TopSearchBooks extends StatefulWidget {
//   @override
//   State<TopSearchBooks> createState() => _TopSearchBooksState();
// }

// class _TopSearchBooksState extends State<TopSearchBooks> {
//   List<BookModel> TopSearchBooksList=[];

//   @override
//   void initState() {
//     super.initState();
//     getTopSearchBooks();
//   }

//   Future<void> getTopSearchBooks() async {
//     var books = await ApiCalling.getTopSearchBooks();
//     stbs.state.setTopSearchBooks(books);
//     setState(() {
//       TopSearchBooksList = books;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(50),
//         child: AppBarScreen(),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(15),
//         child: ListView.builder(
//             itemCount: TopSearchBooksList.length,
//             itemBuilder: (context, int index) {
//               return Column(
//                 children: [
//                   InkWell(
//                     onTap: () {
//                       OneContext().push(MaterialPageRoute(
//                           builder: (_) => BookDetails(
//                                 likes: 35,
//                                 dislikes: 07,
//                                 shares: 03,
//                                 image: TopSearchBooksList[index].cover,
//                                 bookTitle: TopSearchBooksList[index].name,
//                                 bookWriter: TopSearchBooksList[index]
//                                     .authorId!
//                                     .name,
//                               )));
//                     },
//                     child: Row(
//                       children: [
//                         Expanded(
//                           flex: 2,
//                           child: Card(
//                             margin: EdgeInsets.zero,
//                             elevation: 3,
//                             child: ClipRRect(
//                               borderRadius: BorderRadius.circular(5),
//                               child: Image.network(
//                                   fit: BoxFit.cover,
//                                   height: 130,
//                                   width: 110,
//                                   TopSearchBooksList[index].cover),
//                             ),
//                           ),
//                         ),
//                         Expanded(
//                             flex: 4,
//                             child: SizedBox(
//                                 height: 100,
//                                 width: double.infinity,
//                                 child: Padding(
//                                     padding: const EdgeInsets.only(
//                                         left: 20.0, top: 10, bottom: 14),
//                                     child: Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceAround,
//                                         // ignore: prefer_const_literals_to_create_immutables
//                                         children: [
//                                           Text(
//                                             TopSearchBooksList[index].name,
//                                             style: AppStyles.bookTitleStyle,
//                                           ),
//                                           Text(
//                                             "Author: ${TopSearchBooksList[index].authorId!.name}",
//                                             style: AppStyles.getTextStyle(14.0,
//                                                 FontWeight.w600, 0xff263238),
//                                           ),
//                                           SizedBox(
//                                             height: 2,
//                                           )
//                                         ]))))
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   )
//                 ],
//               );
//             }),
//       ),
//     );
//   }
// }
