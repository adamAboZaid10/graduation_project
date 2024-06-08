import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../doctordashbord/model/patient_history_model.dart';

part 'home_controller_state.dart';

class HomeControllerCubit extends Cubit<HomeControllerState> {
  HomeControllerCubit() : super(HomeControllerInitial());

  static HomeControllerCubit get(context) => BlocProvider.of(context);

  int index = 0;
  void bottomNavBar(index) {
    emit(BottomNavBarState(index));
  }

  File? selectedImage;
  final picker = ImagePicker();

  void getImageFromGallery() async {
    emit(SelectedImageLoadingState());
    await picker
        .pickImage(
      source: ImageSource.gallery,
    )
        .then((value) {
      if (value != null) {
        selectedImage = File(value.path);
        emit(SelectedImageSuccessState(selectedImage!));
      }
    }).catchError((error) {
      emit(SelectedImageErrorState(error));
    });
  }

  void getImageCamera() async {
    emit(SelectedImageLoadingState());
    await picker
        .pickImage(
      source: ImageSource.camera,
    )
        .then((value) {
      if (value != null) {
        selectedImage = File(value.path);
        emit(SelectedImageSuccessState(selectedImage!));
      }
    }).catchError((error) {
      emit(SelectedImageErrorState(error));
    });
  }

  Dio dio = Dio();
  String result = "";
  Future<void> postIllnessData({String? token, required File imagePath}) async {
    emit(UploadImageLoadingState());
    try {
      dio.options.headers = {
        "Authorization": "Bearer ${token ?? ""}",
        "Content-Type":
            "multipart/form-data; boundary=<calculated when request is sent>"
      };
      print(" ############## Hello ###############");
      FormData formData = FormData();
      formData.files
          .add(MapEntry("image", await MultipartFile.fromFile(imagePath.path)));
      Response response = await dio.post(
          'http://10.0.2.2:8000/api/CKD?api_password=AHMED\$2024',
          data: formData);
      if (response.statusCode == 200) {
        print("image uploaded successfully");
        result = response.data['commandResult'];
        emit(UploadImageSuccessState());
        print("############## ${response.statusMessage}");
        print("############## ${response.data}");
      } else {
        print("################### Error #################");
      }
    } catch (e) {
      emit(UploadImageErrorState(e.toString()));
      print("@@@@@@@@@@@@@@@@@@ $e #@@@@@@@@@@@@@@@@@@@@@");
    }
  }

  /*Future<void> doctorData({required String token}) async {
    try {
      dio.options.headers = {
        "Authorization": "Bearer ${token ?? ""}",
      };
      print(" ############## Hello ###############");

      Response response = await dio.get(
        'http://10.0.2.2:8000/Doctors/dss?api_password=AHMED\$2024',
      );
      if (response.statusCode == 200) {
        print("Doctor data uploaded successfully");
        print("############## ${response.statusMessage}");
        print("############## ${response.data}");
      } else {
        print("################### Error #################");
      }
    } catch (e) {
      print("@@@@@@@@@@@@@@@@@@ $e #@@@@@@@@@@@@@@@@@@@@@");
    }
  }*/

  List<UserTests> patient = [];
  Future<void> patientData({required String token}) async {
    try {
      emit(PatientDataLoadingState());
      dio.options.headers = {
        "Authorization": "Bearer ${token ?? ""}",
      };
      print(" ############## Hello ###############");

      Response response = await dio.get(
        'http://10.0.2.2:8000/api/Profile?api_password=AHMED\$2024',
      );
      if (response.statusCode == 200) {
        emit(PatientDataSuccessState());
        print("patient data uploaded successfully");
        print("############## ${response.statusMessage}");

        /* var data = response.data['user_Tests'];
        for (int i = 0; i < patient.length; i++) {
          print(patient[0][i]['test_id']);
        }
        patient.add(data);
        print("############## ${patient[0].length}");*/

        response.data['user_Tests'].forEach((e) {
          patient.add(UserTests.fromJson(e));
        });

        print("############## $patient");
      } else {
        emit(PatientDataFailedState());
        print("################### Error #################");
      }
    } catch (e) {
      print("@@@@@@@@@@@@@@@@@@ $e #@@@@@@@@@@@@@@@@@@@@@");
    }
  }
}
