// To parse this JSON data, do
//
//     final bookModel = bookModelFromJson(jsonString);

// ignore_for_file: prefer_if_null_operators

import 'package:meta/meta.dart';
import 'dart:convert';

import 'author_model.dart';

List<BookModel> bookModelFromJson(String str) => List<BookModel>.from(json.decode(str).map((x) => BookModel.fromJson(x)));

String bookModelToJson(List<BookModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BookModel {
    BookModel({
        required this.id,
        required this.name,
        required this.authorId,
        required this.description,
        required this.genre,
        required this.file,
        required this.cover,
        required this.status,
        required this.rejectReason,
        required this.numberOfPages,
        required this.language,
        required this.shares,
        required this.userId,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
    });

    final String? id;
    final String name;
    final AuthorModel? authorId;
    final String description;
    final String? genre;
    final String? file;
    final String cover;
    final String? status;
    final String? rejectReason;
    final String? numberOfPages;
    final String? language;
    final String? shares;
    final String? userId;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final int? v;

    factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
        id: json["_id"] == null ? null : json["_id"],
        name: json["name"] == null ? null : json["name"],
        authorId: json["authorId"] == null ? null : AuthorModel.fromJson(json["authorId"]),
        description: json["description"] == null ? null : json["description"],
        genre: json["genre"] == null ? null : json["genre"],
        file: json["file"] == null ? null : json["file"],
        cover: json["cover"] == null ? null : json["cover"],
        status: json["status"] == null ? null : json["status"],
        rejectReason: json["rejectReason"] == null ? null : json["rejectReason"],
        numberOfPages: json["numberOfPages"] == null ? null : json["numberOfPages"],
        language: json["language"] == null ? null : json["language"],
        shares: json["shares"] == null ? null : json["shares"],
        userId: json["userId"] == null ? null : json["userId"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"] == null ? null : json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "name": name == null ? null : name,
        "authorId": authorId == null ? null : authorId!.toJson(),
        "description": description == null ? null : description,
        "genre": genre == null ? null : genre,
        "file": file == null ? null : file,
        "cover": cover == null ? null : cover,
        "status": status == null ? null : status,
        "rejectReason": rejectReason == null ? null : rejectReason,
        "numberOfPages": numberOfPages == null ? null : numberOfPages,
        "language": language == null ? null : language,
        "shares": shares == null ? null : shares,
        "userId": userId == null ? null : userId,
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "__v": v == null ? null : v,
    };
}

