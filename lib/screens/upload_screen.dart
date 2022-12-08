import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:manybooks_v2/widgets/appbar.dart';

import '../utils/helper.dart';
import '../widgets/rounded_button.dart';
import '../widgets/upload_button.dart';
import '../widgets/upload_form.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({Key? key}) : super(key: key);

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  void openDialogue() {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        content: Container(
          height: 280,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'asset/images/svg_icons/done_icon.svg',height: 120,width: 120,
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                'Book Added',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontFamily: "Open Sans",
                  fontSize: 18,
                ),
              ),
SizedBox(height: 5,),
              Text(
                'Thanks for your contribution and so on',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontFamily: "Open Sans",
                  fontSize: 12,
                ),
              ),
              SizedBox(height: 25),
              Container(
                width: double.infinity,
                child: RoundedButton(
                  buttonAction: () {
                    Navigator.pop(context, 'Done');
                  },
                  backgroundColor: '#263238',
                  buttonText: 'Done',
                  textColor: '#FFFFFF',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
        padding: EdgeInsets.only(top: 25, bottom: 25,left: 16, right: 16),
          child: Column(
            children: [
              UploadForm(
                labelText: 'Book Name',
                hintText: 'Your book name here',
              ),
              SizedBox(
                height: 18,
              ),
              UploadForm(
                labelText: 'Book Author',
                hintText: 'Your book author name here',
              ),
              SizedBox(
                height: 18,
              ),
              UploadForm(
                labelText: 'Book Description',
                hintText: 'Write a description for your book',
              ),
              SizedBox(
                height: 18,
              ),
              UploadForm(
                labelText: 'Book Genre',
                hintText: 'Your book genre',
              ),
              SizedBox(
                height: 24,
              ),
              UploadButton(
                buttonText: 'Upload Book',
                buttonAction: () {},
              ),
              SizedBox(
                height: 24,
              ),
              UploadButton(
                  buttonText: 'Upload Cover Photo', buttonAction: () {}),
              SizedBox(
                height: 40,
              ),
              Container(
                // padding:EdgeInsets.symmetric(vertical: 18) ,
                width: double.infinity,
                child: RoundedButton(
                    buttonAction: openDialogue,
                    backgroundColor: '#263238',
                    buttonText: 'Upload',
                    textColor: 'FFFFFF'),
              ),
              SizedBox(
                height: 18,
              ),
              Center(
                child: Text.rich(
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color(Helper.getHexToInt('#263238')),
                      fontWeight: FontWeight.w300,
                      fontSize: 14,
                      fontFamily: 'Open Sans'),
                  TextSpan(
                    text: 'By uploading the books(s), you agree to our ',
                    children: [
                      TextSpan(
                          text: 'Terms and Conditions ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                          recognizer: TapGestureRecognizer()..onTap = () {}),
                      TextSpan(text: 'and '),
                      TextSpan(
                          text: 'Privacy Policy',
                          style: TextStyle(fontWeight: FontWeight.bold),
                          recognizer: TapGestureRecognizer()..onTap = () {})
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
  }
}


// class DialogExample extends StatelessWidget {
//   const DialogExample({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return TextButton(
//       onPressed: () => showDialog<String>(
//         context: context,
//         builder: (BuildContext context) => AlertDialog(
//           content: Container(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text('Book Added'),
//                 Text('Thanks for your contribution and so on'),
//                 SizedBox(height: 50),
//                 Container(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     onPressed:(){},
//                     child: Text('Done'),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//       child: const Text('Show Dialog'),
//     );
//   }
// }
