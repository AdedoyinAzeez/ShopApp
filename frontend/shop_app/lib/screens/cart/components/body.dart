import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/models/Cart.dart';
import 'package:shop_app/size_config.dart';
import 'cart_item_card.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  //List<Cart> carts = [];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: ListView.builder(
        itemCount: carts.length,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Dismissible(
            key: Key(carts[index].product.id.toString()),
            direction: DismissDirection.endToStart,
            background: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Color(0xFFFFE6E6),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Spacer(),
                  SvgPicture.asset("assets/icons/Trash.svg"),
                ],
              ),
            ),
            onDismissed: (direction) {
              setState(() {
                carts.removeAt(index);
                //total -= demoCarts[index].product.price * demoCarts[index].numOfItems;
              });
            },
            child: CartItemCard(cart: carts[index]),
          ),
        ),
      ),
    );
  }
}
