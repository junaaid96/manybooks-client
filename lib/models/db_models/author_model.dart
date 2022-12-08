
import 'dart:convert';

List<AuthorModel> authorModelFromJson(String str) => List<AuthorModel>.from(json.decode(str).map((x) => AuthorModel.fromJson(x)));

String authorModelToJson(List<AuthorModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AuthorModel {
    AuthorModel({
        required this.id,
        required this.name,
        required this.avatar,
        required this.description,
        required this.birth,
        required this.death,
        required this.wikipedia,
        required this.isVerified,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
    });

    final String? id;
    final String name;
    final String? avatar;
    final String? description;
    final String? birth;
    final String? death;
    final String? wikipedia;
    final bool? isVerified;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final int? v;

    factory AuthorModel.fromJson(Map<String, dynamic> json) => AuthorModel(
        id: json["_id"] == null ? null : json["_id"],
        name: json["name"] == null ? null : json["name"],
        avatar: json["avatar"] == null ? null : json["avatar"],
        description: json["description"] == null ? null : json["description"],
        birth: json["birth"] == null ? null : json["birth"],
        death: json["death"] == null ? null : json["death"],
        wikipedia: json["wikipedia"] == null ? null : json["wikipedia"],
        isVerified: json["isVerified"] == null ? null : json["isVerified"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"] == null ? null : json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "name": name == null ? null : name,
        "avatar": avatar == null ? null : avatar,
        "description": description == null ? null : description,
        "birth": birth == null ? null : birth,
        "death": death == null ? null : death,
        "wikipedia": wikipedia == null ? null : wikipedia,
        "isVerified": isVerified == null ? null : isVerified,
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "__v": v == null ? null : v,
    };
}
