import 'package:flutter/material.dart';

class RoundedIconBtn extends StatefulWidget {
  const RoundedIconBtn({
    Key? key,
    required this.iconData,
    required this.press,
    required this.height,
    required this.width,
    required this.borderRadius,
    required this.scale,
  }) : super(key: key);

  final IconData iconData;
  final GestureTapCallback press;
  final double height;
  final double width;
  final double borderRadius;
  final double scale;

  @override
  State<RoundedIconBtn> createState() => _RoundedIconBtnState();
}

class _RoundedIconBtnState extends State<RoundedIconBtn> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: FlatButton(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
        ),
        onPressed: widget.press,
        child: Center(
          child: Transform.scale(
            scale: widget.scale,
            child: Icon(widget.iconData),
          ),
        ),
        color: Colors.white,
      ),
    );
  }
}
