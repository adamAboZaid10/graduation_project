import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of(context);

  bool obscureText = true;
  IconData
  suffix = Icons.visibility_outlined;

  void changePasswordVisibility() {
    obscureText = !obscureText;
    suffix =
    obscureText ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    print(obscureText);
    emit(ChangePasswordVisibility());
  }
}
