import 'package:flutter/material.dart';
import 'package:shop_app/components/rounded_icon_btn.dart';
import 'package:shop_app/models/Cart.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({
    Key? key,
    required this.cart,
  }) : super(key: key);

  final Cart cart;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 88,
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(10)),
              decoration: BoxDecoration(
                color: Color(0xFFF5F6F9),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset(cart.product.images[0]),
            ),
          ),
        ),
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cart.product.title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
              maxLines: 2,
            ),
            SizedBox(height: 10),
            Container(
              color: Colors.lightBlue,
              child: Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ClipRect(
                    clipBehavior: Clip.antiAlias,
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.end,
                      // crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text.rich(
                          TextSpan(
                            text: "\$${cart.product.price}",
                            style: TextStyle(
                                color: kPrimaryColor,
                                fontWeight: FontWeight.w600),
                            children: [
                              TextSpan(
                                text: " x${cart.numOfItems}",
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ],
                          ),
                        ),
                        //Spacer(),
                        SizedBox(width: getProportionateScreenWidth(100)),

                        RoundedIconBtn(
                          height: getProportionateScreenHeight(20),
                          width: getProportionateScreenWidth(20),
                          borderRadius: getProportionateScreenWidth(50),
                          scale: 1.0,
                          iconData: Icons.remove,
                          press: () {},
                        ),
                        SizedBox(width: getProportionateScreenWidth(20)),

                        RoundedIconBtn(
                          iconData: Icons.add,
                          press: () {},
                          height: getProportionateScreenHeight(20),
                          width: getProportionateScreenWidth(20),
                          borderRadius: getProportionateScreenWidth(50),
                          scale: 1.0,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
