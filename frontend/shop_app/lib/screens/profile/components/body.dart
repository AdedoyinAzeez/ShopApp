import 'package:flutter/material.dart';
import 'package:shop_app/screens/sign_in/sign_in_screen.dart';
import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfilePic(),
        SizedBox(height: 20),
        ProfileMenu(
          icon: "assets/icons/User Icon.svg",
          press: () {},
          text: "My Account",
        ),
        ProfileMenu(
          icon: "assets/icons/Bell.svg",
          press: () {},
          text: "Notifications",
        ),
        ProfileMenu(
          icon: "assets/icons/Settings.svg",
          press: () {},
          text: "Settings",
        ),
        ProfileMenu(
          icon: "assets/icons/Question mark.svg",
          press: () {},
          text: "Help Center",
        ),
        ProfileMenu(
          icon: "assets/icons/Log out.svg",
          press: () => Navigator.of(context).pushNamedAndRemoveUntil(
              SignInScreen.routeName, ModalRoute.withName('/')),
          text: "Log Out",
        ),
      ],
    );
  }
}
