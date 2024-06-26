import 'package:flutter/material.dart';

class TitleAuth extends StatelessWidget {
  const TitleAuth({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      "$title",
      style: Theme.of(context)
          .textTheme
          .headlineLarge
          ?.copyWith(color: Colors.white, fontSize: 32),
    );
  }
}
