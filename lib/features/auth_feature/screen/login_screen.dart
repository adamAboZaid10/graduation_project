import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_final_project/features/auth_feature/controller/auth_cubit.dart';

import '../widgets/login_widgets/login_screen_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return BlocProvider(
      create: (BuildContext context) => AuthCubit(),
      child: Scaffold(
        body: LoginScreenBody(
          formKey: formKey,
        ),
      ),
    );
  }
}
