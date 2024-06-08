import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_final_project/core/class/GET.dart';
import 'package:graduation_final_project/core/class/curd.dart';
import 'package:graduation_final_project/core/class/statusrequest.dart';
import 'package:graduation_final_project/core/funcation/handlingData.dart';
import 'package:graduation_final_project/features/doctordashbord/Data/datapatient.dart';
import 'package:graduation_final_project/features/doctordashbord/model/dashbordmodel.dart';
import 'package:graduation_final_project/features/doctordashbord/Data/data.dart';
import 'package:graduation_final_project/features/doctordashbord/model/doctormodel.dart';
import 'package:graduation_final_project/features/doctordashbord/model/gettastdata.dart';

class GetPatentdataController extends GetxController {
  CurdDashbord curd = CurdDashbord();
  DashbordPatientData dashbordData =
      DashbordPatientData(Get.put(CurdDashbord()));

  var data = <GetpatientModel>[].obs;
  var doctorData = DoctorModel().obs;

  late StatusRequest statusRequest = StatusRequest.none;

  @override
  getdata(int id, String token) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await dashbordData.getData(id, token);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      var patientsData = response['user_test'];
      var doctordata = response['doc_id'];
      print(doctordata);

      doctorData.value = DoctorModel.fromJson(doctordata);

      data.addAll(patientsData
          .map<GetpatientModel>((json) => GetpatientModel.fromJson(json))
          .toList());
    }
    update();
  }
}
