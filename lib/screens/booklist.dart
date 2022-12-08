import 'package:flutter/material.dart';
import 'package:manybooks_v2/models/db_models/morebooks_model.dart';
import 'package:manybooks_v2/models/states/stb.dart';
import 'package:manybooks_v2/utils/api_callings.dart';
import 'package:one_context/one_context.dart';

import 'package:manybooks_v2/screens/book_details_screen.dart';
import 'package:manybooks_v2/ui/styles/styles.dart';
import 'package:states_rebuilder/scr/state_management/legacy/state_builder.dart';

import '../models/db_models/book_model.dart';
import '../widgets/appbar.dart';

class BookList extends StatefulWidget {
  List<BookModel>? books;
  BookList({this.books});

  @override
  State<BookList> createState() => _BookListState();
}

class _BookListState extends State<BookList> {
  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    getMoreBooks();
    handleNext();
  }

  Future<void> getMoreBooks() async {
    List<MoreBooksModel> moreBooks =
        await ApiCalling.getPopularMoreBooks(stbs.state.page);
    // stbs.state.setMoreBooks(moreBooks);
    print("object");
  }

  void handleNext() {
    scrollController.addListener(() async {
      if (scrollController.position.maxScrollExtent ==
          scrollController.position.pixels) {
        await ApiCalling.getPopularMoreBooks(stbs.state.page);
      }
    });
  }

  // String type;
  @override
  Widget build(BuildContext context) {
    // final books = ModalRoute.of(context)!.settings.arguments as List<BookModel>;
    return StateBuilder(
        observe: () => stbs,
        builder: (context, _) => Scaffold(
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(50),
                child: AppBarScreen(),
              ),
              body: Padding(
                padding: EdgeInsets.all(15),
                child: ListView.builder(
                    controller: scrollController,
                    itemCount: stbs.state.result.length,
                    itemBuilder: (context, int index) {
                      return Column(
                        children: [
                          InkWell(
                            onTap: () {
                              OneContext().push(MaterialPageRoute(
                                  builder: (_) => BookDetails(
                                        likes: 35,
                                        dislikes: 07,
                                        shares: 03,
                                        image: widget.books![index].cover,
                                        bookTitle: widget.books![index].name,
                                        bookWriter:
                                            widget.books![index].authorId!.name,
                                      )));
                            },
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Card(
                                    margin: EdgeInsets.zero,
                                    elevation: 3,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5),
                                      child: Image.network(
                                          fit: BoxFit.cover,
                                          height: 130,
                                          width: 110,
                                          stbs.state.result[index].cover),
                                    ),
                                  ),
                                ),
                                Expanded(
                                    flex: 4,
                                    child: SizedBox(
                                        height: 100,
                                        width: double.infinity,
                                        child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20.0,
                                                top: 10,
                                                bottom: 14),
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                // ignore: prefer_const_literals_to_create_immutables
                                                children: [
                                                  Text(
                                                    stbs.state.result[index]
                                                        .name,
                                                    style: AppStyles
                                                        .bookTitleStyle,
                                                  ),
                                                  Text(
                                                    "Author: ${stbs.state.result[index].authorId!.name}",
                                                    style:
                                                        AppStyles.getTextStyle(
                                                            14.0,
                                                            FontWeight.w600,
                                                            0xff263238),
                                                  ),
                                                  SizedBox(
                                                    height: 2,
                                                  )
                                                ]))))
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      );
                    }),
              ),
            ));
  }
}
