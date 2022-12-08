import 'package:flutter/material.dart';
import 'package:manybooks_v2/models/after_login.dart';
import 'package:manybooks_v2/utils/api_callings.dart';
import 'package:manybooks_v2/utils/firebase_auth_methods.dart';
import 'package:manybooks_v2/widgets/rounded_button.dart';
import 'package:one_context/one_context.dart';
import 'package:prefs/prefs.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Prefs.init();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  
  Future checkToken(String? tokenJson) async {
    if (tokenJson != null) {
      Prefs.setString("tokenData", tokenJson);
      OneContext().pushNamed('/dashboard');
    } else {
      print("null");
    }
  }

  onFacebookLogin() async {
    AfterLogin al = await FirebaseAuthMethod().signinWithFacebook();
    String? tokenJson = await ApiCalling.login(al);
    print(tokenJson);
    await checkToken(tokenJson);
  }

  onGoogleLogin() async {
    AfterLogin al =await FirebaseAuthMethod().signInWithGoogle();
    String? tokenJson = await ApiCalling.login(al);
    print(tokenJson);
    await checkToken(tokenJson);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 50.0,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image(image: AssetImage('asset/images/abc.png')),
          ),
          SizedBox(
            height: 50.0,
          ),
          Container(
            height: 40,
            width: 300,
            child: RoundedButton(
                buttonText: "Login with FACEBOOK",
                buttonAction: onFacebookLogin),
          ),
          SizedBox(height: 10),
          Container(
            height: 40,
            width: 300,
            child: RoundedButton(
                buttonText: "Login with GOOGLE", buttonAction: onGoogleLogin),
          ),
        ],
      ),
    ));
  }
}
