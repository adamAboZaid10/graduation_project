import 'package:flutter/material.dart';

class CustomDefaultButton extends StatelessWidget {
  const CustomDefaultButton(
      {super.key,
      required this.onPressed,
      required this.color,
      required this.text,
      this.width,
      this.textColor,
      this.radius,
      this.height,
      this.fontSize,
      this.fontWeight});

  final GestureTapCallback onPressed;
  final Color color;
  final Color? textColor;
  final String text;
  final double? width;
  final double? height;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      width: width,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(radius!)),
      child: MaterialButton(
        color: color,
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
              color: textColor, fontSize: fontSize, fontWeight: fontWeight),
        ),
      ),
    );
  }
}
