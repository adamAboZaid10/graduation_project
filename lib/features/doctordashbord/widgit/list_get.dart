import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:graduation_final_project/core/constant/approutes.dart';
import 'package:graduation_final_project/features/doctordashbord/model/doctormodel.dart';
import 'package:graduation_final_project/features/doctordashbord/model/gettastdata.dart'; // Import PatientModel

class ListGrtTests extends StatelessWidget {
  final GetpatientModel getpatientModel;
  final DoctorModel doctorModel;

  // Accept GetpatientModel and DoctorModel as parameters
  const ListGrtTests({
    required this.getpatientModel,
    required this.doctorModel,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var analysisResult = getpatientModel.analysisResult;
    return Card(
      child: ListTile(
        onTap: () {
          Get.offNamed(AppRoutes.Reportpage, arguments: {
            'getpatientModel': getpatientModel,
            'doctorModel': doctorModel,
          });
        },
        title: Text(
          "Type of analysis: ${getpatientModel.analysisType}",
          style: TextStyle(fontSize: 18.h),
        ),
        subtitle: Text(
          analysisResult == 0
              ? "Result of analysis: Good"
              : "Result of analysis: Sick",
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
