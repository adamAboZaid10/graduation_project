import 'package:flutter/material.dart';

Widget tabBarView({
  required BuildContext context,
  required Widget widget,
  required bool isActive,
  required void Function()? onTap,
}) {
  Size media = MediaQuery.of(context).size;
  return Container(
    alignment: Alignment.center,
    height: media.height - (media.height - 35),
    width: media.width - (media.width - 35),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
    child: InkWell(onTap: onTap, child: widget),
  );
}
