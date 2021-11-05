import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/models/Cart.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/screens/cart/cart_screen.dart';
import 'package:shop_app/size_config.dart';
import 'color_dots.dart';
import 'product_description.dart';
import 'product_images.dart';
import 'top_rounded_container.dart';

class Body extends StatelessWidget {
  final Product product;
  //final int numOfItems = 0;

  const Body({required this.product});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ProductImages(product: product),
          TopRoundedContainer(
            color: Colors.white,
            child: Column(
              children: [
                ProductDescription(
                  product: product,
                  pressOnSeeMore: () {},
                ),
                TopRoundedContainer(
                  color: Color(0xFFF6F7F9),
                  child: Column(
                    children: [
                      ColorDots(product: product),
                      TopRoundedContainer(
                        color: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: SizeConfig.screenWidth * 0.15,
                            right: SizeConfig.screenWidth * 0.15,
                            top: getProportionateScreenWidth(15),
                            bottom: getProportionateScreenWidth(40),
                          ),
                          child: DefaultButton(
                            text: "Add to Cart",
                            press: () {
                              var cart = new Cart(
                                product: product,
                                numOfItems: ColorDots.numOfItems,
                              );

                              //if (cart.numOfItems == 0) ColorDots.numOfItems++;

                              addToCart(cart, context);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void addToCart(Cart cart, BuildContext context) {
  try {
    bool matched = false;
    int index = 0;

    if (carts.length == 0) {
      carts.add(
        Cart(
          product: cart.product,
          numOfItems: ColorDots.numOfItems,
        ),
      );
    } else {
      for (int i = 0; i < carts.length; i++) {
        if (carts[i].product == cart.product) {
          //tempProduct = carts[i].product;
          matched = true;
          index = i;
          break;
        } else {
          matched = false;
        }
      }

      if (matched) {
        carts[index].numOfItems += ColorDots.numOfItems;
      } else {
        carts.add(
          Cart(
            product: cart.product,
            numOfItems: ColorDots.numOfItems,
          ),
        );
      }
    }
    Navigator.pushNamed(context, CartScreen.routeName, arguments: carts);
  } catch (e) {
    log(e.toString());
    throw e;
  }

  //ColorDots.numOfItems = 0;
}
