import 'package:flutter/material.dart';
import 'package:shop_app/enums.dart';
import 'package:shop_app/screens/profile/components/custom_bottom_nav_bar.dart';

import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(
        selectedMenu: MenuState.home,
      ),
    );
  }
}
