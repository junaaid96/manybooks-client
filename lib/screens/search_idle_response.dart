import 'package:flutter/material.dart';
import 'package:manybooks_v2/models/db_models/category_model.dart';
import 'package:manybooks_v2/ui/styles/styles.dart';
import 'package:manybooks_v2/widgets/small_book_part.dart';

import '../models/db_models/search_idle_model.dart';

class SingleCategoryOfBook extends StatelessWidget {
  SearchIdleResponse? searchIdleResponse;

  SingleCategoryOfBook({super.key, this.searchIdleResponse});

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
                searchIdleResponse!.title,
                style:
                    AppStyles.getTextStyle(18.0, FontWeight.w700, 0xff263238),
              ),
              Text("More",
                  style: AppStyles.getTextStyle(
                      18.0, FontWeight.w600, 0xff4B9DA8)),
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
              itemCount: searchIdleResponse!.items!.length,
              itemBuilder: (ctx, i) => SmallBookPart(
                id: searchIdleResponse!.items![i].id!,
                writer: searchIdleResponse!.items![i].authorId!.name,
                title: searchIdleResponse!.items![i].name,
                image: searchIdleResponse!.items![i].cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
