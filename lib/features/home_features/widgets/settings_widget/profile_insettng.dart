import 'package:flutter/material.dart';
import 'package:graduation_final_project/core/constant/color.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class IamgeProfile extends StatefulWidget {
  const IamgeProfile({super.key});

  @override
  State<IamgeProfile> createState() => _DarkModeState();
}

class _DarkModeState extends State<IamgeProfile> {
  bool status = false;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: height * 0.007, horizontal: width * 0.03),
      child: ListTile(
        contentPadding: EdgeInsets.zero, // Added to remove default padding
        onTap: () {},
        title: SizedBox(
          width: width * 0.6, // Adjust the width as needed
          child: const Text(
            "Dark Mode",
            style: TextStyle(
              color: AppColor.blackColor,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        trailing:  Container(
          width: width * 0.075,
          height: height * .035,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: AppColor.secondColor,
          ),
          child: const Icon(
            LineAwesomeIcons.angle_right,
            color: AppColor.whiteColor,
          ),
        ),
      ),
    );
  }
}
