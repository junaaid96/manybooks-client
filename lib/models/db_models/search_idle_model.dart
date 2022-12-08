// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

import 'package:manybooks_v2/models/db_models/book_model.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

import '../../utils/helpers.dart';

class SearchIdleResponse {
    SearchIdleResponse({
        required this.title,
        required this.items,
    });


    final String title;
    final List<BookModel>? items;

    factory SearchIdleResponse.fromRawJson(String str) => SearchIdleResponse.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory SearchIdleResponse.fromJson(Map<String, dynamic> json) => SearchIdleResponse(
        title: json["title"] == null ? null : json["title"],
        items: json["items"] == null ? null : List<BookModel>.from(json["items"].map((x) => BookModel.fromJson(x))),
            // items: json["items"] == null ? null : json["items"],
    );

    Map<String, dynamic> toJson() => {
        "title": title == null ? null : title,
        "items": items == null ? null : List<dynamic>.from(items!.map((x) => x.toJson())),
    };
}