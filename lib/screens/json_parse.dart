import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

class JsonParseScreen extends StatefulWidget {
  JsonParseScreen({Key? key}) : super(key: key);

  @override
  State<JsonParseScreen> createState() => _JsonParseScreenState();
}

class _JsonParseScreenState extends State<JsonParseScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    something();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

something() async {
  var request = http.Request(
      'GET', Uri.parse('https://api.npoint.io/0b6d32c39d4b4d067c72'));

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    // print(await response.stream.bytesToString());
    String jsonStr = await response.stream.bytesToString();
    // print(jsonStr);
//     var mm = json.decode(jsonStr);
// print(mm);
List t = json.decode(jsonStr);
List<TestModel> mm = t.map((e) => TestModel.fromJson(e)).toList();
// TestModel mm = TestModel.fromRawJson(jsonStr);
print(mm);
    // String phone0 = mm[0]["phone"];
    // String gender0 = mm[0]["gender"];
    // print("phone1: $phone0\n gender1: $gender0");
    // String phone1 = mm[1]["phone"];
    // String gender1 = mm[1]["gender"];
    // print("phone2: $phone1\n gender2: $gender1");
    // print(mm[0]["phone"]);
  } else {
    print(response.reasonPhrase);
  }
}

class TestModel {
  TestModel({
    @required this.phone,
    @required this.gender,
  });

  final String? phone;
  final String? gender;

  factory TestModel.fromRawJson(String str) =>
      TestModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TestModel.fromJson(Map<String, dynamic> json) => TestModel(
        phone: json["phone"] == null ? null : json["phone"],
        gender: json["gender"] == null ? null : json["gender"],
      );

  Map<String, dynamic> toJson() => {
        "phone": phone == null ? null : phone,
        "gender": gender == null ? null : gender,
      };
}

