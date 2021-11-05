import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shop_app/components/edit_num_of_items.dart';
import 'package:shop_app/models/Product.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class ColorDots extends StatefulWidget {
  const ColorDots({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;
  static late int numOfItems = 0;

  @override
  State<ColorDots> createState() => _ColorDotsState();
}

class _ColorDotsState extends State<ColorDots> {
  @override
  Widget build(BuildContext context) {
    int selectedColor = 3;

    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        children: [
          ...List.generate(
            widget.product.colors.length,
            (index) => ColorDot(
              color: widget.product.colors[index],
              isSelected: selectedColor == index,
            ),
          ),
          Spacer(),
          EditNumOfItems(
            borderRadius: getProportionateScreenWidth(50),
            height: getProportionateScreenHeight(40),
            width: getProportionateScreenWidth(40),
            scale: 1.0,
            fontSize: getProportionateScreenWidth(16),
            numOfItems: ColorDots.numOfItems,
          ),
        ],
      ),
    );
  }
}

TextFormField buildNumOfItemsField() {
  return TextFormField(
    keyboardType: TextInputType.number,
    onSaved: (newValue) => ColorDots.numOfItems = newValue! as int,
    onChanged: (value) {
      ColorDots.numOfItems = value as int;
      return null;
    },
    style: TextStyle(
      fontSize: getProportionateScreenWidth(16),
      fontWeight: FontWeight.w600,
    ),
  );
}

class ColorDot extends StatefulWidget {
  const ColorDot({
    Key? key,
    required this.color,
    this.isSelected = false,
  }) : super(key: key);

  final Color color;
  final bool isSelected;

  @override
  State<ColorDot> createState() => _ColorDotState();
}

class _ColorDotState extends State<ColorDot> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 2),
      padding: EdgeInsets.all(8),
      height: getProportionateScreenHeight(40),
      width: getProportionateScreenWidth(40),
      decoration: BoxDecoration(
        //color: product.colors[0],
        shape: BoxShape.circle,
        border: Border.all(
            color: widget.isSelected ? kPrimaryColor : Colors.transparent),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: widget.color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
