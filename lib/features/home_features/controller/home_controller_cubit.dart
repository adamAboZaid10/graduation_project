import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'home_controller_state.dart';

class HomeControllerCubit extends Cubit<HomeControllerState> {
  HomeControllerCubit() : super(HomeControllerInitial());

  HomeControllerCubit get(context) => BlocProvider.of(context);

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

  Future<void> postIllnessData({String? token, required File imagePath}) async {
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
        print("############## ${response.statusMessage}");
        print("############## ${response.data}");
      } else {
        print("################### Error #################");
      }
    } catch (e) {
      print("@@@@@@@@@@@@@@@@@@ $e #@@@@@@@@@@@@@@@@@@@@@");
    }
  }
}
