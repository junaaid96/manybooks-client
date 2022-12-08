import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:one_context/one_context.dart';
import '../models/states/stb.dart';
import '../widgets/rounded_button.dart';
import 'login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  void loginwithFacebookAction() {}

  @override
  Widget build(BuildContext context) {
    return StateBuilder(
      observe: () => stbs,
      builder: (context, _) => Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                Text("Number: ${stbs.state.counter}"),
                ElevatedButton(
                  onPressed: () {
                    stbs.state.increase(1);
                  },
                  child: Text(
                    "Increase",
                  ),
                ),
                // RoundedButton(
                //   backgroundColor: '#263238',
                //   buttonAction: LoginScreen().onGoogleLogin,
                //   textColor: '#FFFFFF',
                //   borderColor: '#000000',
                //   buttonText: 'Login with Google',
                // ),
                // RoundedButton(
                //   backgroundColor: '#FFFFFF',
                //   buttonAction: loginwithFacebookAction,
                //   textColor: '#000000',
                //   borderColor: '#000000',
                //   buttonText: 'Login with Facebook',
                // )
                ElevatedButton(
                  onPressed: () {
                    // Navigator.pushNamed(context, '/login');
                    // OneContext().pushNamed('/login');
                    OneContext().pushNamed('/login');
                  },
                  child: Text(
                    "Login",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    // return  ;
  }
}
