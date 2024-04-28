import 'package:flutter/material.dart';
import 'package:graduation_final_project/core/constant/color.dart';

import 'search_delegate.dart';

Widget searchDelegate(BuildContext context) {
  Size media = MediaQuery.of(context).size;
  return Container(
    height: media.height - (media.height * (93 / 100)),
    width: media.width * (68 / 100),
    decoration: BoxDecoration(
        color:AppColor.blueWhiteColor,
        borderRadius:
            BorderRadius.circular(media.width - (media.width * (85 / 100)))),
    child: Row(
      children: [
        SizedBox(
          width: media.width - (media.width * 97 / 100),
        ),
        IconButton(
            onPressed: () {
              showSearch(context: context, delegate: SearchData());
            },
            icon: const Icon(
              Icons.search,
              color: Colors.white,
              size: 30,
            )),
      ],
    ),
  );
}
