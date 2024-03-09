import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:graduation_final_project/core/constant/color.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class DarkMode extends StatefulWidget {
  const DarkMode({super.key});

  @override
  State<DarkMode> createState() => _DarkModeState();
}

class _DarkModeState extends State<DarkMode> {
  bool status = false;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: height * 0.007, horizontal: width * 0.03),
      child: ListTile(
        onTap: () {},
        leading: Container(
          width: width * 0.075,
          height: height * .035,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Color.fromARGB(255, 135, 7, 255),
          ),
          child: Icon(
            LineAwesomeIcons.moon,
            color: whitecolor,
          ),
        ),
        title: Text("Dark Mode",
            style: TextStyle(
                color: blackcolor, fontSize: 15, fontWeight: FontWeight.w600)),
        trailing: SizedBox(
          width: width * .12, // Adjust the width as needed
          child: FlutterSwitch(
            width: width * .3,
            height: height * .03,
            value: status,
            activeColor: primaryColor,
            inactiveColor: Colors.black38,
            onToggle: (val) {
              setState(() {
                status = val;
              });
            },
          ),
        ),
      ),
    );
  }
}
