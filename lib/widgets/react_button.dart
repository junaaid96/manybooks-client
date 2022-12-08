import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ReactButton extends StatelessWidget {
  String reactIcon, reactType, reactCount;
  ReactButton(this.reactIcon, this.reactType, this.reactCount);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      height: 40,
      width: 100,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Color(0xff000000),
          blurRadius: 10,
          spreadRadius: -12,
          // blurStyle: BlurStyle.inner
        )
      ]),
      child: Card(
        elevation: 1,
        shadowColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(reactIcon, height: 12),
              Text(
                reactType,
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff263238)),
              ),
              // SizedBox(
              //   width: 7,
              // ),
              Text(
                reactCount,
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff263238)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
