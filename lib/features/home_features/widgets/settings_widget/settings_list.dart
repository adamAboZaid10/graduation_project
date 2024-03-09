import 'package:flutter/material.dart';
import 'package:graduation_final_project/core/constant/color.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class SettingMenu extends StatelessWidget {
  const SettingMenu(
      {super.key,
      required this.icon,
      required this.titel,
      required this.onTap,
      required this.titlecolor,
      required this.endicon,
      required this.backiconcolor});
  final Icon icon;
  final String titel;
  final Function()? onTap;
  final Color? titlecolor;
  final Color? backiconcolor;
  final bool endicon;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: height * 0.007, horizontal: width * 0.03),
      child: ListTile(
        onTap: onTap,
        leading: Container(
          width: width * 0.075,
          height: height * .035,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: backiconcolor,
          ),
          child: icon,
        ),
        title: Text(titel,
            style: TextStyle(
                color: titlecolor, fontSize: 15, fontWeight: FontWeight.w600)),
        trailing: endicon
            ? Container(
                width: width * 0.075,
                height: height * .035,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: secondcolor,
                ),
                child: Icon(
                  LineAwesomeIcons.angle_right,
                  color: whitecolor,
                ),
              )
            : null,
      ),
    );
  }
}
