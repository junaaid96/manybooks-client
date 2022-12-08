import 'package:flutter/material.dart';
import 'package:manybooks_v2/models/db_models/category_model.dart';
import 'package:manybooks_v2/models/db_models/search_idle_model.dart';
import 'package:manybooks_v2/widgets/category_booklist.dart';
import 'package:manybooks_v2/models/states/stb.dart';
import 'package:manybooks_v2/utils/api_callings.dart';
import 'package:states_rebuilder/scr/state_management/legacy/state_builder.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController controller = TextEditingController();
  List<SearchIdleResponse>? searchidleresponse;
  @override
  void initState() {
    super.initState();
    getBook();
  }

  Future<void> getBook() async {
    List<CategoryModel> categorizedBooks =
        await ApiCalling.searchIdleResponse();
    stbs.state.setCategorizedBooks(categorizedBooks);
    print("object");
  }

  // Future<void> searchidle() async {
  //   List<CategoryModel> categorizedBooks =
  //       await ApiCalling.getCategorizedBooks();
  //   stbs.state.setCategorizedBooks(categorizedBooks);
  //   print("object");
  // }

  String searchController = "";
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
              Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: SizedBox(
                      height: 35,
                      child: TextField(
                          // onSubmitted: (String) {
                          //   print(controller.text);
                          // },
                          onSubmitted: (_) async {
                            searchController = controller.text;
                            await ApiCalling().searchBook(searchController);
                          },
                          controller: controller,
                          // onChanged: searchBook,
                          // controller: searchController,
                          textAlignVertical: TextAlignVertical.center,
                          style: TextStyle(color: Colors.black, fontSize: 12),
                          cursorColor: Colors.grey,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical: 5),
                              fillColor: Color(0xffEBEBEB),
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7),
                                  borderSide: BorderSide.none),
                              hintText: 'Search',
                              hintStyle: TextStyle(
                                  color: Color(0xffBDBDBD),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700),
                              // prefixIcon: Image.network(
                              //   'https://uxwing.com/wp-content/themes/uxwing/download/user-interface/search-icon.png',
                              //   height: 2,
                              //   color: Color(0xff4D5960),
                              // ),
                              prefixIcon: Padding(
                                padding:
                                    const EdgeInsets.only(left: 17.0, right: 3),
                                child: Icon(
                                  Icons.search_outlined,
                                  size: 18,
                                  color: Color(0xff4D5960),
                                ),
                              ),
                              prefixIconConstraints: BoxConstraints(
                                maxWidth: 40,
                                minHeight: 25,
                              ))),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 460,
                child: ListView.builder(
                  // shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: stbs.state.categorizedBooks.length,
                  itemBuilder: (ctx1, i1) => CategoryOfBooks(
                    categoryModel: stbs.state.categorizedBooks[i1],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// StateBuilder(
//         observe: () => stbs,
//         builder: (context, _) => 