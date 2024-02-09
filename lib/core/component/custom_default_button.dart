import 'package:flutter/material.dart';

class CustomDefaultButton extends StatelessWidget {
  const CustomDefaultButton({
    super.key,
    required this.onPressed,
    required this.color,
    required this.text,
    this.width,
    this.textColor,
    this.radius
  });

  final GestureTapCallback onPressed;
  final Color color;
  final Color? textColor;
  final String text;
  final double? width ;
  final double? radius ;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius!)
      ),
      child: MaterialButton(
        color: color,
        onPressed: onPressed,
        child:  Text(text,style: TextStyle(color: textColor),),),
    );
  }
}
