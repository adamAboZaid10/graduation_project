part of 'home_controller_cubit.dart';

@immutable
abstract class HomeControllerState {}

class HomeControllerInitial extends HomeControllerState {}


 class SelectedImageLoadingState extends HomeControllerState{}
class SelectedImageSuccessState extends HomeControllerState
{
  final File selectedImage;
  SelectedImageSuccessState(this.selectedImage);
}

class SelectedImageErrorState extends HomeControllerState {
  final String error ;
  SelectedImageErrorState(this.error);
}