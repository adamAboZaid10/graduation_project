import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

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
}
