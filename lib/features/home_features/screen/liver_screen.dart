import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_final_project/core/component/screen_title.dart';
import 'package:graduation_final_project/features/home_features/controller/home_controller_cubit.dart';

import '../widgets/liver_widgets/liver_screen_body.dart';

class LiverScreen extends StatelessWidget {
  const LiverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomeControllerCubit(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const CustomScreenTitle(
            title: "Liver Disease",
          ),
        ),
        body: const LiverBody(),
      ),
    );
  }
}
