// To parse this JSON data, do
//
//     final moreBooksModel = moreBooksModelFromJson(jsonString);

import 'package:manybooks_v2/models/db_models/book_model.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

class MoreBooksModel {
    MoreBooksModel({
        required this.data,
        required this.total,
    });

    List<BookModel>? data;
    int total;

    factory MoreBooksModel.fromRawJson(String str) => MoreBooksModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory MoreBooksModel.fromJson(Map<String, dynamic> json) => MoreBooksModel(
        data: json["data"] == null ? null : List<BookModel>.from(json["data"].map((x) => BookModel.fromJson(x))),
        total: json["total"] == null ? null : json["total"],
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? null : List<dynamic>.from(data!.map((x) => x.toJson())),
        "total": total == null ? null : total,
    };
}
