import 'package:flutter/material.dart';
import 'package:manybooks_v2/models/db_models/category_model.dart';
import 'package:manybooks_v2/screens/booklist.dart';
import 'package:manybooks_v2/screens/popular_book_list.dart';
import 'package:manybooks_v2/screens/recently_uploaded_booklist.dart';
import 'package:manybooks_v2/ui/styles/styles.dart';
import 'package:manybooks_v2/utils/api_callings.dart';
import 'package:manybooks_v2/widgets/small_book_part.dart';
import 'package:one_context/one_context.dart';

class SingleCategoryOfBooks extends StatelessWidget {
  CategoryModel? categoryModel;
  int? index;
  SingleCategoryOfBooks({super.key, this.categoryModel, this.index});
  // const SingleCategoryOfBooks({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                categoryModel!.title,
                style:
                    AppStyles.getTextStyle(18.0, FontWeight.w700, 0xff263238),
              ),
              InkWell(
                onTap: () {
                  if (index == 0)
                    OneContext().push(
                        MaterialPageRoute(builder: (_) => PopularBookList()));
                  else
                    OneContext().push(
                        MaterialPageRoute(builder: (_) => RecentBookList()));
                  // await ApiCalling.getPopularMoreBooks();
                },
                child: Text("More",
                    style: AppStyles.getTextStyle(
                        18.0, FontWeight.w600, 0xff4B9DA8)),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 200,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 5),
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              // shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemCount: categoryModel!.items!.length,
              itemBuilder: (ctx, i) => SmallBookPart(
                id: categoryModel!.items![i].id!,
                writer: categoryModel!.items![i].authorId!.name,
                title: categoryModel!.items![i].name,
                image: categoryModel!.items![i].cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
