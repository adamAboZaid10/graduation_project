part of 'home_controller_cubit.dart';

abstract class HomeControllerState {}

class HomeControllerInitial extends HomeControllerState {}

class SelectedImageLoadingState extends HomeControllerState {}

class SelectedImageSuccessState extends HomeControllerState {
  final File selectedImage;

  SelectedImageSuccessState(this.selectedImage);
}

class SelectedImageErrorState extends HomeControllerState {
  final String error;

  SelectedImageErrorState(this.error);
}

class UploadImageLoadingState extends HomeControllerState {}

class UploadImageSuccessState extends HomeControllerState {}

class UploadImageErrorState extends HomeControllerState {
  final String error;

  UploadImageErrorState(this.error);
}
