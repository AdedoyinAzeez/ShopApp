import 'package:flutter/material.dart';
import 'package:shop_app/screens/product_details/components/color_dots.dart';
import '../size_config.dart';
import 'rounded_icon_btn.dart';

class EditNumOfItems extends StatefulWidget {
  EditNumOfItems(
      {Key? key,
      required this.height,
      required this.width,
      required this.borderRadius,
      required this.scale,
      required this.fontSize,
      required this.numOfItems})
      : super(key: key);

  final double height;
  final double width;
  final double borderRadius;
  final double scale;
  final double fontSize;
  late int numOfItems;

  @override
  _EditNumOfItemsState createState() => _EditNumOfItemsState();
}

class _EditNumOfItemsState extends State<EditNumOfItems> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RoundedIconBtn(
          iconData: Icons.remove,
          press: () {
            if (ColorDots.numOfItems <= 0) {
              setState(() {
                ColorDots.numOfItems = 0;
              });
            } else {
              setState(() {
                ColorDots.numOfItems -= 1;
              });
            }
          },
          borderRadius: widget.borderRadius,
          height: widget.height,
          width: widget.width,
          scale: widget.scale,
        ),
        SizedBox(width: getProportionateScreenWidth(15)),
        NumberOfItems(
          fontSize: widget.fontSize,
          height: widget.height,
          width: widget.width,
        ),
        SizedBox(width: getProportionateScreenWidth(15)),
        RoundedIconBtn(
          iconData: Icons.add,
          press: () {
            setState(() {
              ColorDots.numOfItems += 1;
            });
          },
          borderRadius: widget.borderRadius,
          height: widget.height,
          width: widget.width,
          scale: widget.scale,
        ),
      ],
    );
  }
}

class NumberOfItems extends StatefulWidget {
  const NumberOfItems({
    Key? key,
    required this.height,
    required this.width,
    required this.fontSize,
  }) : super(key: key);

  final double height;
  final double width;
  final double fontSize;

  @override
  State<NumberOfItems> createState() => _NumberOfItemsState();
}

class _NumberOfItemsState extends State<NumberOfItems> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: EdgeInsets.zero,
      child: DecoratedBox(
        child: SizedBox(
          height: widget.height,
          width: widget.width,
          child: Center(
            child: Text(
              "${ColorDots.numOfItems}",
              style: TextStyle(
                fontSize: widget.fontSize,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
        ),
      ),
    );
  }
}
