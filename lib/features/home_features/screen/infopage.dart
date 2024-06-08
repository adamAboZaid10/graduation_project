import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InformathionPage extends StatelessWidget {
  const InformathionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("How to use"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.h),
              child: Row(
                children: [
                  Text("1 - ",
                      style: TextStyle(fontSize: 20.h, color: Colors.black)),
                  Text("Choose Patient Test",
                      style: TextStyle(
                          fontSize: 20.h,
                          color: const Color.fromARGB(255, 98, 98, 98)))
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.h),
              child: Row(
                children: [
                  Text("2 - ",
                      style: TextStyle(fontSize: 20.h, color: Colors.black)),
                  Text("Choose Type of Test",
                      style: TextStyle(
                          fontSize: 20.h,
                          color: const Color.fromARGB(255, 98, 98, 98)))
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.h),
              child: Row(
                children: [
                  Text("3 - ",
                      style: TextStyle(fontSize: 20.h, color: Colors.black)),
                  Text("Upload Image of Test",
                      style: TextStyle(
                          fontSize: 20.h,
                          color: const Color.fromARGB(255, 98, 98, 98)))
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.h),
              child: Row(
                children: [
                  Text("4 - ",
                      style: TextStyle(fontSize: 20.h, color: Colors.black)),
                  Text("Display Results of Test",
                      style: TextStyle(
                          fontSize: 20.h,
                          color: const Color.fromARGB(255, 98, 98, 98)))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
