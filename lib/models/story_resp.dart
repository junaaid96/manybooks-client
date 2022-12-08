// To parse this JSON data, do
//
//     final storyResp = storyRespFromJson(jsonString);

import 'package:manybooks_v2/models/db_models/story_model.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

class StoryResp {
  StoryResp({
    required this.data,
    required this.total,
  });

  List<StoryModel>? data;
  int total;

  factory StoryResp.fromRawJson(String str) =>
      StoryResp.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory StoryResp.fromJson(Map<String, dynamic> json) => StoryResp(
        data: json["data"] == null
            ? null
            : List<StoryModel>.from(
                json["data"].map((x) => StoryModel.fromJson(x))),
        total: json["total"] == null ? null : json["total"],
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "total": total == null ? null : total,
      };
}
