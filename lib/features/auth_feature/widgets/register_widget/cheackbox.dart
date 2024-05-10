import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_final_project/core/constant/color.dart';

class CustomCheckbox extends StatelessWidget {
  const CustomCheckbox({
    Key? key,
    required this.label,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  final String label;
  final bool value;
  final Function(bool?) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 36.h, right: 36.h, top: 10.h),
      child: Row(
        children: [
          Checkbox(
            value: value,
            onChanged: onChanged,
            visualDensity: VisualDensity.compact,
            activeColor: value
                ? Colors.grey
                : null, // Change color to grey when selected
          ),
          Text(
            label,
            style: TextStyle(fontSize: 18.sp, color: AppColor.blueWhiteColor),
          ),
        ],
      ),
    );
  }
}
