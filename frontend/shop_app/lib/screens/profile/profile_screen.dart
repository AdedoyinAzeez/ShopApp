import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/enums.dart';

import 'components/body.dart';
import 'components/custom_bottom_nav_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  static String routeName = "/profile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: TextStyle(color: kTextColor),
        ),
      ),
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(
        selectedMenu: MenuState.profile,
      ),
    );
  }
}
