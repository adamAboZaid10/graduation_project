import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_final_project/core/class/GET.dart';
import 'package:graduation_final_project/core/class/curd.dart';
import 'package:graduation_final_project/core/class/statusrequest.dart';
import 'package:graduation_final_project/core/funcation/handlingData.dart';
import 'package:graduation_final_project/features/doctordashbord/model/dashbordmodel.dart';
import 'package:graduation_final_project/features/doctordashbord/Data/data.dart';

class DashbordController extends GetxController {
  CurdDashbord curd = CurdDashbord();
  DashbordData dashbordData = DashbordData(Get.put(CurdDashbord()));
  var data = [];
  List<patientModel> patientsList = []; // Renamed from datapatien
  late StatusRequest statusRequest = StatusRequest.none;
  @override
  getdata(String token) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await dashbordData.getData(token);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      var doctorData = response['doctor'];
      var patientsData = response['patients'];
      print(patientsData);

      if (StatusRequest.success == statusRequest) {
        if (patientsData is List<dynamic>) {
          data.add(doctorData);

          patientsList.clear(); // Clear previous data
          patientsList.addAll(patientsData.map((e) {
            if (e is Map<String, dynamic>) {
              return patientModel.fromJson(e);
            } else {
              throw FormatException('Unexpected data format in patientsData');
            }
          }).toList());
        } else {
          print('patientsData is not a List<dynamic>');
        }
      } else {
        print('Failed to fetch data');
      }
    }
    update();
  }
}
