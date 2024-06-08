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
class BottomNavBarState extends HomeControllerState {

  int index;
  BottomNavBarState(this.index);
}

class UploadImageSuccessState extends HomeControllerState {}

class UploadImageErrorState extends HomeControllerState {
  final String error;

  UploadImageErrorState(this.error);
}


class PatientDataLoadingState extends HomeControllerState{}
class PatientDataSuccessState extends HomeControllerState{}
class PatientDataFailedState extends HomeControllerState{}
