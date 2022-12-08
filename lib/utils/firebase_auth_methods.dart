
import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/drive/v3.dart' as drive;
import 'package:http/http.dart' as http;
// import 'package:manybooks_admin/models/after_login.dart';
import 'package:prefs/prefs.dart';

import '../main.dart';
import '../models/after_login.dart';
// import '../views/user_dashboard.dart';

class FirebaseAuthMethod {
  handleAuthState() {
    // return StreamBuilder(
    //   stream: FirebaseAuth.instance.authStateChanges(),
    //   builder: (BuildContext context, AsyncSnapshot snapshot) {
    //     if (snapshot.hasData && snapshot.data != null) {
    //       final userDoc = snapshot.data;
    //       return UserDashboard();
    //     } else {
    //       return HomeScreen();
    //     }
    //   },
    // );
    // final token = prefs.getString('tokenData');

    // prefs token paile UserDashboard();
    // prefs token na paile HomeScreen();

    //get token from prefs

    // final token = getToken();
    // if (token == "") {
    //   return HomeScreen();
    // } else {
    //   return UserDashboard();
    // }
  }

  getToken() {
    final token = Prefs.getString('tokenData');
    print(token);
    return token;
  }
  

  Future<AfterLogin> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser =
        await GoogleSignIn(scopes: <String>["email"]).signIn();

    final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    User? user = userCredential.user;

    return AfterLogin(
        credential.accessToken, user?.email, user?.displayName, "google");
  }

  Future<AfterLogin> signinWithFacebook() async {
    // bool isLoggedIn = false;
    // FacebookAuth.instance
    //     .login(permissions: ["public_profile", "email"]).then((value) {
    //   var a = value.accessToken!.token;
    //   .then((userData) async {
    //     // setState() {}
    //     print(userData);
    // //   });
    // // });

    LoginResult res = await FacebookAuth.instance
        .login(permissions: ["public_profile", "email"]);
    var token = res.accessToken!.token;
    Map<String, dynamic> userData =
        await FacebookAuth.instance.getUserData(fields: "name,email");
    print("FACEBOOK LOGIN SUCCESS EMAIL: ${userData['email']}");
    return AfterLogin(token, userData['email'], userData['name'], "facebook");

  }

//   Future<void> logOut() async {
//     await FirebaseAuth.instance.signOut();
//   }

//   Future<drive.DriveApi> getDriveApi() async {
//     final GoogleSignInAccount? googleUser = await GoogleSignIn(scopes: <String>[
//       "email",
//       "https://www.googleapis.com/auth/drive",
//       "https://www.googleapis.com/auth/drive.file"
//     ]).signIn();
//     final headers = await googleUser?.authHeaders;

//     final client = GoogleAuthClient(headers!);
//     // final client = googleUser?.GoogleAuthClient(headers);
//     final driveApi = drive.DriveApi(client);
//     return driveApi;
//   }

//   Future<void> uploadToHidden() async {
//     // try {
//     //   final driveApi = await _getDriveApi();
//     //   if (driveApi == null) {
//     //     return;
//     //   }
//     //   // Not allow a user to do something else
//     //   showGeneralDialog(
//     //     context: context,
//     //     barrierDismissible: false,
//     //     transitionDuration: Duration(seconds: 2),
//     //     barrierColor: Colors.black.withOpacity(0.5),
//     //     pageBuilder: (context, animation, secondaryAnimation) => Center(
//     //       child: CircularProgressIndicator(),
//     //     ),
//     //   );
//     // } finally {
//     //   // Remove a dialog
//     //   Navigator.pop(context);
//     // }

// // Create data here instead of loading a file
//     const contents = "Technical Feeder";
//     final Stream<List<int>> mediaStream =
//         Future.value(contents.codeUnits).asStream().asBroadcastStream();
//     var media = drive.Media(mediaStream, contents.length);

// // Set up File info
//     var driveFile = drive.File();
//     final timestamp = DateTime.now();
//     driveFile.name = "technical-feeder-$timestamp.txt";
//     driveFile.modifiedTime = DateTime.now().toUtc();
//     driveFile.parents = ["appDataFolder"];
//     final driveApi = await getDriveApi();
//     final response = await driveApi.files.create(driveFile, uploadMedia: media);
//   }

//   Future<String?> getFolderId(drive.DriveApi driveApi) async {
//     const mimeType = "application/vnd.google-apps.folder";
//     String folderName = "Flutter-sample-by-tf";

//     try {
//       final found = await driveApi.files.list(
//         q: "mimeType = '$mimeType' and name = '$folderName'",
//         $fields: "files(id, name)",
//       );
//       final files = found.files;
//       if (files == null) {
//         print("Sign in First");
//         return null;
//       }

//       // The folder already exists
//       if (files.isNotEmpty) {
//         return files.first.id;
//       }

//       // Create a folder
//       var folder = drive.File();
//       folder.name = folderName;
//       folder.mimeType = mimeType;
//       final folderCreation = await driveApi.files.create(folder);
//       print("Folder ID: ${folderCreation.id}");

//       return folderCreation.id;
//     } catch (e) {
//       print(e);
//       return null;
//     }
//   }

//   Future<void> uploadToNormal(
//       BuildContext context, PlatformFile pickedFile) async {
//     try {
//       final driveApi = await getDriveApi();
//       print(driveApi);
//       // Check if the folder exists. If it doesn't exist, create it and return the ID.
//       final folderId = await getFolderId(driveApi);
//       if (folderId == null) {
//         print("null");
//         return;
//       }

//       // // Create data here instead of loading a file
//       // const contents = "Technical Feeder";
//       // final Stream<List<int>> mediaStream =
//       //     Future.value(contents.codeUnits).asStream().asBroadcastStream();
//       // var media = drive.Media(mediaStream, contents.length);

//       // Set up File info
//       var driveFile = drive.File();
//       final timestamp = DateTime.now();
//       driveFile.name = pickedFile.name;
//       print(driveFile.name);
//       driveFile.modifiedTime = DateTime.now().toUtc();

//       // !!!!!! Set the folder ID here !!!!!!!!!!!!
//       driveFile.parents = [folderId];
//       File file = File(pickedFile.path ?? '');
//       print(file.path);
//       // Upload
//       final response = await driveApi.files.create(driveFile,
//           uploadMedia: drive.Media(file.openRead(), file.lengthSync()));
//       print(response.id);
//       generatePublicURL(response);
//       // simulate a slow process
//       await Future.delayed(const Duration(seconds: 2));
//     } finally {
//       // Remove a dialog

//       return Navigator.pop(context);
//     }
//   }

//   Future generatePublicURL(response) async {
//     try {
//       final driveApi = await getDriveApi();
//       var fileid = response.id;
//       await driveApi.permissions
//           .create(drive.Permission(role: "reader", type: "anyone"), fileid);
//       dynamic result = await driveApi.files
//           .get(fileid, $fields: 'webViewLink, webContentLink');
//       print(result.webContentLink);
//     } catch (error) {
//       print(error);
//     }
//   }
}
