import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_final_project/features/auth_feature/controller/auth_cubit.dart';

import '../widgets/register_widget/register_screen_body.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>AuthCubit(),
      child: const  Scaffold(
        body: RegisterScreenBody(),
      ),
    );
  }
}
