// To parse this JSON data, do
//
//     final storyModel = storyModelFromJson(jsonString);

import 'package:manybooks_v2/models/db_models/user_model.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

class StoryModel {
    StoryModel({
        required this.id,
        required this.image,
        required this.text,
        required this.likes,
        required this.userId,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
    });

    final String id;
    final String image;
    final String text;
    final String likes;
    final UserModel? userId;
    final String createdAt;
    final String updatedAt;
    final int v;

    factory StoryModel.fromRawJson(String str) => StoryModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory StoryModel.fromJson(Map<String, dynamic> json) => StoryModel(
        id: json["_id"] == null ? null : json["_id"],
        image: json["image"] == null ? null : json["image"],
        text: json["text"] == null ? null : json["text"],
        likes: json["likes"] == null ? null : json["likes"],
        userId: json["userId"] == null ? null : UserModel.fromJson(json["userId"]),
        createdAt: json["createdAt"] == null ? null : json["createdAt"],
        updatedAt: json["updatedAt"] == null ? null : json["updatedAt"],
        v: json["__v"] == null ? null : json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "image": image == null ? null : image,
        "text": text == null ? null : text,
        "likes": likes == null ? null : likes,
        "userId": userId == null ? null : userId!.toJson(),
        "createdAt": createdAt == null ? null : createdAt,
        "updatedAt": updatedAt == null ? null : updatedAt,
        "__v": v == null ? null : v,
    };
}
