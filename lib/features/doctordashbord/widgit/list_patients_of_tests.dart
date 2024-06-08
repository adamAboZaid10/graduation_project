import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:graduation_final_project/core/constant/approutes.dart';
import 'package:graduation_final_project/features/doctordashbord/model/dashbordmodel.dart'; // Import PatientModel

class list_patients_of_tests extends StatelessWidget {
  final patientModel patient; // Accept PatientModel as parameter

  const list_patients_of_tests({required this.patient, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          Get.toNamed(AppRoutes.Display, arguments: patient);
        },
        title: Text(
          patient.patientName ?? "",
          style: TextStyle(fontSize: 18.h),
        ),
        subtitle: Text(
          "patient Age: ${patient.patientAge}",
          style: TextStyle(fontSize: 15.h, color: Colors.grey),
        ),
        trailing: Icon(
          Icons.chevron_right,
          size: 35.h,
        ),
      ),
    );
  }
}
