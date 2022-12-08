import 'package:flutter/material.dart';
import 'package:manybooks_v2/models/db_models/category_model.dart';
import 'package:manybooks_v2/screens/dummy.dart';
import 'package:manybooks_v2/screens/popular_book_list.dart';
import 'package:manybooks_v2/screens/recently_uploaded_booklist.dart';
import 'package:manybooks_v2/ui/styles/styles.dart';
import 'package:manybooks_v2/utils/api_callings.dart';
import 'package:manybooks_v2/widgets/single_category_book.dart';
import 'package:states_rebuilder/scr/state_management/legacy/state_builder.dart';
import '../models/db_models/book_model.dart';
import '../models/states/stb.dart';
import '../widgets/small_book_part.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({Key? key}) : super(key: key);

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  String text =
      "It's the possibility of having a dream come true that makes life interesting.";
  String author = '"The Alchemist" by Paulo Coelho';

  @override
  void initState() {
    super.initState();
    getBook();
  }

  Future<void> getBook() async {
    List<CategoryModel> categorizedBooks = await ApiCalling.getCategorizedBooks();
    stbs.state.setCategorizedBooks(categorizedBooks);
    print("object");
  }

  @override
  Widget build(BuildContext context) {
    return StateBuilder(
        observe: () => stbs,
        builder: (context, _) => SafeArea(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(vertical: 15),
                // dragStartBehavior: DragStartBehavior.down,
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Container(
                      height: 460,
                      child: ListView.builder(
                        // shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: stbs.state.categorizedBooks.length,
                        itemBuilder: (ctx1, i1) => SingleCategoryOfBooks(
                          categoryModel: stbs.state.categorizedBooks[i1],
index: i1
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 120,
                      width: 400,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 30, horizontal: 35),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Text(
                                '"$text"',
                                style: AppStyles.getCrimsonTextStyle(
                                    14.0, FontWeight.w600, 0xff000000),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Align(
                                alignment: Alignment.bottomRight,
                                child: Text("-$author",
                                    style: AppStyles.getCrimsonTextItalicStyle(
                                        12.0,
                                        FontWeight.w500,
                                        0xff000000,
                                        FontStyle.italic))),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ));
  }
}
