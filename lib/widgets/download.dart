import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:manybooks_v2/screens/viewer.dart';
import 'package:path_provider/path_provider.dart';
import 'package:dio/dio.dart';

String newlink = "";
String gdrive() {
  String str =
      'https://drive.google.com/file/d/18Sj9_jDXuSGGgAb4D6zJBPK8bbi_EFVX/view?usp=sharing';
  var arr = str.split('/');
  var bcd = (arr[5]);
  String efg = "https://drive.google.com/uc?export=download&id=";
  newlink = efg + bcd;
  return newlink;
}

class DownloadingDialog extends StatefulWidget {
  const DownloadingDialog({super.key});

  @override
  State<DownloadingDialog> createState() => _DownloadingDialogState();
}

class _DownloadingDialogState extends State<DownloadingDialog> {
  Dio dio = Dio();
  double progress = 0.0;

  void startDownloading() async {
    // const String url =
    //     'https://drive.google.com/uc?export=download&id=1aqPBtu2s4JRy8Avx0dFUHgKnCKrwKpUS';
    const String fileName = "Jamal Khan.pdf";
    String path = await _getFilePath(fileName);
    newlink = gdrive();
    await dio.download(
      newlink,
      path,
      onReceiveProgress: (receivedBytes, totalBytes) {
        setState(() {
          progress = receivedBytes / totalBytes;
        });

        print(progress);
      },
      deleteOnError: true,
    ).then((_) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Viewer(path)));
    });
    print(path);
  }

  Future<String> _getFilePath(String filename) async {
    final dir = await getApplicationDocumentsDirectory();
    return "${dir.path}/$filename";
  }

  @override
  void initState() {
    super.initState();
    startDownloading();
  }

  @override
  Widget build(BuildContext context) {
    String downloadingProgress = (progress * 100).toInt().toString();
    return AlertDialog(
      backgroundColor: Colors.black,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircularProgressIndicator.adaptive(),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Downloading: $downloadingProgress",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 17,
            ),
          )
        ],
      ),
    );
  }
}
