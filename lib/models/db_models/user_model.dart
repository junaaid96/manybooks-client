// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class UserModel {
    UserModel({
        required this.id,
        required this.email,
        required this.v,
        required this.createdAt,
        required this.name,
        required this.updatedAt,
    });

    final String id;
    final String email;
    final int v;
    final DateTime? createdAt;
    final String name;
    final DateTime? updatedAt;

    factory UserModel.fromRawJson(String str) => UserModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["_id"] == null ? null : json["_id"],
        email: json["email"] == null ? null : json["email"],
        v: json["__v"] == null ? null : json["__v"],
        name: json["name"] == null ? null : json["name"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "email": email == null ? null : email,
        "__v": v == null ? null : v,
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "name": name == null ? null : name,
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
    };
}
