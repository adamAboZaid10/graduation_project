import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_final_project/core/constant/color.dart';

class ButtonAuth extends StatelessWidget {
  const ButtonAuth({super.key, required this.onPressed, required this.child});
  final Function()? onPressed;
  final String child;

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(40.r),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(185, 91, 175, 200),
                AppColor.blueWhiteColor,
              ]),
        ),
        child: MaterialButton(
          onPressed: onPressed,
          child: Text(
            child,
            style: TextStyle(fontSize: 18.h, color: Colors.white),
          ),
        ));
  }
}
