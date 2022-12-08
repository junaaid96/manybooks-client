import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ViewStory extends StatelessWidget {
String storylink;
ViewStory({Key? key, this.storylink = "https://tools.toywiz.com/_images/_webp/_products/lg/ts4miniventriloquistdummy.webp"}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
image: DecorationImage(
            image: NetworkImage(storylink),
            fit: BoxFit.cover,
          ),
));
  }
}
