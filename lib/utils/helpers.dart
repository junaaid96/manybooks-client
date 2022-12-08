import 'dart:convert';

import 'package:manybooks_v2/models/db_models/book_model.dart';
import 'package:manybooks_v2/models/db_models/category_model.dart';
import 'package:manybooks_v2/models/db_models/search_idle_model.dart';
import 'package:manybooks_v2/models/db_models/morebooks_model.dart';
import 'package:manybooks_v2/models/xml_model.dart';
import 'package:manybooks_v2/screens/search_idle_response.dart';

import 'package:manybooks_v2/models/db_models/story_model.dart';

class Helpers {
  static convertBookJsonToList(jsonStr) {
    final List t = json.decode(jsonStr);
    final List<BookModel> portasAbertasList =
        t.map((item) => BookModel.fromJson(item)).toList();
    return portasAbertasList;
  }

  static convertCategoryJsonToList(jsonStr) {
    final List t = json.decode(jsonStr);
    final List<CategoryModel> portasAbertasList =
        t.map((item) => CategoryModel.fromJson(item)).toList();
    return portasAbertasList;
  }

  static convertSearchIdleJsonToList(String jsonStr) {
    final List t = json.decode(jsonStr);
    final List<SearchIdleResponse> portasAbertasList =
        t.map((item) => SearchIdleResponse.fromJson(item)).toList();
    return portasAbertasList;
  }

  static convertStoryJsonToList(jsonStr) {
    final List t = json.decode(jsonStr);
    final List<StoryModel> portasAbertasList =
        t.map((item) => StoryModel.fromJson(item)).toList();
    return portasAbertasList;
  }

  static convertMoreBooksJsonToList(jsonStr) {
    final List t = json.decode(jsonStr);
    final List<MoreBooksModel> portasAbertasList =
        t.map((item) => MoreBooksModel.fromJson(item)).toList();
    return portasAbertasList;
  }

  static convertXMLJsonToList(jsonStr) {
    // final List t = json.decode(jsonStr);
    // final List<PDFModel> portasAbertasList =
    //     t.map((item) => PDFModel.fromJson(item)).toList();
    // final List<PDFModel> portasAbertasList =
    //     t.map((item) => PDFModel.fromJson(item)).toList();
    final welcome9 = welcome9FromJson(jsonStr);
    return welcome9;
  }
}