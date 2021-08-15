import 'package:flutter/material.dart';

import 'components/body.dart';

class SignInScreen extends StatelessWidget {
  //const SignInScreen({Key? key}) : super(key: key);
  static String routeName = "/sign_in";

  @override
  Widget build(BuildContext context) {
    //SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sign In",
          textAlign: TextAlign.center,
        ),
      ),
      body: Body(),
    );
  }
}
