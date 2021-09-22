import 'package:flutter/material.dart';
import 'package:shop_app/screens/home/components/icon_btn_with_counter.dart';
import '../../../size_config.dart';
import 'search_field.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SearchField(),
          IconBtnWithCounter(
            press: () {},
            svgSrc: 'assets/icons/Cart Icon.svg',
          ),
          IconBtnWithCounter(
            press: () {},
            numOfItems: 3,
            svgSrc: 'assets/icons/Bell.svg',
          ),
        ],
      ),
    );
  }
}
