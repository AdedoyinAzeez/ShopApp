import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/models/Cart.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class CheckOutCard extends StatelessWidget {
  const CheckOutCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final total = calculateTotal(cart)
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(15),
        vertical: getProportionateScreenHeight(30),
      ),
      //height: 174,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  height: getProportionateScreenHeight(40),
                  width: getProportionateScreenWidth(40),
                  decoration: BoxDecoration(
                    color: Color(0xFFF5F6F9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SvgPicture.asset("assets/icons/receipt.svg"),
                ),
                Spacer(),
                Text("Add voucher code"),
                const SizedBox(width: 10),
                Icon(Icons.arrow_forward_ios, size: 12, color: kTextColor),
              ],
            ),
            SizedBox(height: getProportionateScreenHeight(20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    text: "Total:\n",
                    children: [
                      TextSpan(
                        text: "\$${calculateTotal(carts).roundToDouble()}",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(190),
                  child: DefaultButton(text: "Check Out", press: () {}),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

double calculateTotal(List<Cart> cart) {
  var sum = 0.0;
  for (var i = 0; i < cart.length; i++) {
    sum += (cart[i].product.price * cart[i].numOfItems);
  }
  return sum;
}
