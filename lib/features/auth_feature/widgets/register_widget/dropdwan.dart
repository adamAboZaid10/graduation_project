import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_final_project/core/constant/color.dart';

class CustomDropdown extends StatelessWidget {
  const CustomDropdown({
    Key? key,
    required this.hintText,
    required this.label,
    required this.items,
    required this.onChanged,
    required this.value,
  }) : super(key: key);

  final String hintText;
  final String label;
  final List<String> items;
  final void Function(String?) onChanged;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20.h, right: 20.h, top: 30.h),
      child: InputDecorator(
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 14.h, color: AppColor.secondColor),
          labelText: label,
          labelStyle: TextStyle(fontSize: 20.h, color: AppColor.blueWhiteColor),
          contentPadding:
              EdgeInsets.symmetric(horizontal: 30.h, vertical: 17.h),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.r),
          ),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: value,
            isExpanded: true,
            onChanged: onChanged,
            items: items.map((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: TextStyle(fontSize: 14.h, color: AppColor.secondColor),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
