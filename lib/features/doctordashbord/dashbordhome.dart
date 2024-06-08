import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:graduation_final_project/core/constant/color.dart';
import 'package:graduation_final_project/features/doctordashbord/dashbordprofile.dart';
import 'package:graduation_final_project/features/doctordashbord/doctordashbord.dart';

class DashbordHomeScreen extends StatefulWidget {
  const DashbordHomeScreen({super.key});

  @override
  State<DashbordHomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<DashbordHomeScreen> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    final items = <Widget>[
      Icon(
        Icons.home_rounded,
        size: 30,
        color: index == 0
            ? const Color.fromARGB(255, 122, 122, 122)
            : const Color.fromARGB(255, 255, 255, 255),
      ),
      Icon(
        Icons.person,
        size: 30,
        color: index == 1
            ? const Color.fromARGB(255, 122, 122, 122)
            : const Color.fromARGB(255, 255, 255, 255),
      ),
    ];
    final screen = [
      const DoctorDashbord(),
      const DashbordProfilePage(),
    ];
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        color: AppColor.blueWhiteColor,
        index: index,
        height: height * 0.075,
        backgroundColor: const Color.fromARGB(0, 252, 252, 252),
        items: items,
        buttonBackgroundColor: const Color.fromARGB(0, 252, 252, 252),
        onTap: (index) {
          setState(() {
            this.index = index;
          });
        },
      ),
      body: screen[index],
    );
  }
}
