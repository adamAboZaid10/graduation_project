import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_final_project/core/component/screen_title.dart';
import 'package:graduation_final_project/features/home_features/controller/home_controller_cubit.dart';
import '../widgets/illness_widgets/illness_screen_body.dart';

class IllnessScreen extends StatelessWidget {
  const IllnessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomeControllerCubit(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const CustomScreenTitle(
            title: "First Illness",
          ),
        ),
        body: const IllnessScreenBody(),
      ),
    );
  }
}
