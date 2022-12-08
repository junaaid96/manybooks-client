// import 'package:flutter/cupertino.dart';
// import 'package:manybooks_v2/models/db_models/category_model.dart';
// import 'package:manybooks_v2/screens/test.dart';
// import 'package:manybooks_v2/utils/api_callings.dart';

// class DummyScreen extends StatefulWidget {
//   const DummyScreen({super.key});

//   @override
//   State<DummyScreen> createState() => _DummyScreenState();
// }

// class _DummyScreenState extends State<DummyScreen> {
//   List<CategoryModel>? categorizedBooks = [];
//   @override
//   void initState() {
//     super.initState();
//     getBook();
//   }

//   Future<void> getBook() async {
//     var abc = await ApiCalling.getCategorizedBooks();
//     setState(() {
//       categorizedBooks = abc;
//     });
//     print("object");
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (categorizedBooks!.isNotEmpty) {
//       return ListView.builder(
//         itemCount: categorizedBooks!.length,
//         itemBuilder: (ctx1, i1) => SingleCategoryOfBooks(
//           categoryModel: categorizedBooks![i1],
//         ),
//       );
//     } else {
//       return Text("AHHAHA");
//     }
//   }
// }

// class SingleCategoryOfBooks extends StatelessWidget {
//   CategoryModel? categoryModel;

//   SingleCategoryOfBooks({super.key, this.categoryModel});

//   // const SingleCategoryOfBooks({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Row(
//           children: [
//             Text(categoryModel!.title),
//           ],
//         ),
//         SizedBox(
//           height: 250,
//           child: ListView.builder(
//             shrinkWrap: true,
//             scrollDirection: Axis.horizontal,
//             // shrinkWrap: true,
//             physics: ClampingScrollPhysics(),
//             itemCount: categoryModel!.items!.length,
//             itemBuilder: (ctx, i) => SingleSmallBookItem(
//               writer: categoryModel!.items![i].authorId!.name,
//               title: categoryModel!.items![i].name,
//               image: categoryModel!.items![i].cover,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
