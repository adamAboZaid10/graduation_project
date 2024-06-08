import 'package:flutter/material.dart';
import 'package:graduation_final_project/core/constant/color.dart';
import 'package:graduation_final_project/features/doctordashbord/dashbordprofile.dart';
import 'package:graduation_final_project/features/doctordashbord/doctordashbord.dart';

class DashbordHomeScreen extends StatefulWidget {
  const DashbordHomeScreen({Key? key}) : super(key: key);

  @override
  State<DashbordHomeScreen> createState() => _HomeBarState();
}

class _HomeBarState extends State<DashbordHomeScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      const DoctorDashbord(),
      const DashbordProfilePage()
    ];

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
        currentIndex: index,
        selectedItemColor:
            AppColor.blueWhiteColor, // Make sure AppColor is defined
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            this.index = index;
          });
        },
      ),
      body: screens[index],
    );
  }
}
