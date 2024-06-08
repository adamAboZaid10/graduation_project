import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_final_project/core/constant/color.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class DoctorCircular extends StatelessWidget {
  final int totalPatients = 100;
  final int presentPatients;
  final int totalTests = 200;
  final int readTests;
  const DoctorCircular({
    required this.presentPatients,
    required this.readTests,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double patientPercent = presentPatients / totalPatients;
    double testPercent = readTests / totalTests;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 5.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Column(
              children: [
                CircularPercentIndicator(
                  radius: 60.0.sp,
                  lineWidth: 10.0.h,
                  animation: true,
                  percent: patientPercent,
                  center: Text(
                    "${presentPatients}",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0.h,
                        color: AppColor.blueWhiteColor),
                  ),
                  footer: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.h),
                    child: Text(
                      "Patients",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0.h,
                          color: Colors.black),
                    ),
                  ),
                  circularStrokeCap: CircularStrokeCap.round,
                  progressColor: AppColor.blueWhiteColor,
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                CircularPercentIndicator(
                  radius: 50.0.sp,
                  lineWidth: 10.0.h,
                  animation: true,
                  percent: testPercent,
                  center: Text(
                    "${readTests}",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0.h,
                        color: const Color.fromARGB(255, 113, 211, 116)),
                  ),
                  footer: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.h),
                    child: Text(
                      "Tests",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0.h,
                          color: Colors.black),
                    ),
                  ),
                  circularStrokeCap: CircularStrokeCap.round,
                  progressColor: const Color.fromARGB(255, 110, 199, 113),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
