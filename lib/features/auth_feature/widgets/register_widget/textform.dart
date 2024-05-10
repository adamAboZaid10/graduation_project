import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_final_project/core/constant/color.dart';

class TextForm extends StatelessWidget {
  const TextForm({
    Key? key,
    required this.hintText,
    required this.label,
    required this.suffixIcon,
    this.mycontroller,
    required this.valed,
    required this.isNum,
    this.obscureText,
    this.onTap,
  }) : super(key: key);

  final String hintText;
  final String label;
  final IconData suffixIcon;
  final TextEditingController? mycontroller;
  final String? Function(String?)? valed;
  final bool isNum;
  final bool? obscureText;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20.h, right: 20.h, top: 30.h),
      child: TextFormField(
        controller: mycontroller,
        obscureText: obscureText == null || obscureText == false ? false : true,
        keyboardType: isNum
            ? TextInputType.numberWithOptions(decimal: true)
            : TextInputType.text,
        validator: valed,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: "$hintText",
          hintStyle: TextStyle(fontSize: 14.h, color: AppColor.secondColor),
          suffixIcon: InkWell(
            onTap: onTap,
            child: Icon(
              suffixIcon,
              color: AppColor.blueWhiteColor,
            ),
          ),
          labelText: "$label",
          labelStyle: TextStyle(fontSize: 20.h, color: AppColor.blueWhiteColor),
          contentPadding:
              EdgeInsets.symmetric(horizontal: 30.h, vertical: 17.h),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.r),
          ),
        ),
      ),
    );
  }
}
