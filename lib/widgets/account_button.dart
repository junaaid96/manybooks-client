import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    required this.title,
    required this.svgSrc,
    required this.press,
  }) : super(key: key);
  final String title, svgSrc;
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Center(
        child: ListTile(
          visualDensity: VisualDensity(horizontal: 0, vertical: -4),
          // contentPadding: EdgeInsets.zero,
          onTap: press,

          leading: SvgPicture.asset(svgSrc, color: Colors.black, height: 20),
          title: Text(
            title,
            style: TextStyle(
                color: Colors.black,
                fontFamily: 'OpenSans',
                fontSize: 12,
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
