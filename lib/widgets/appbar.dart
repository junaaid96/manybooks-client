import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AppBarScreen extends StatelessWidget {
String title;
AppBarScreen({this.title= "MANYBOOKS"});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 3,
        shadowColor: Colors.grey,
        centerTitle: false,
        leadingWidth: 0,
        title: Text(
          title,
          style: TextStyle(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.w800),
        ),
        // ignore: prefer_const_literals_to_create_immutables
        actions: [
          Icon(Icons.more_vert, color: Colors.black),
SizedBox(width: 10,)
        ],
      );
  }
}