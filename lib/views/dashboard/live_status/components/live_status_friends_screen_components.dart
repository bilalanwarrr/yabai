import 'package:flutter/material.dart';
import 'package:yabai/utils/assets_routes.dart';
import 'package:yabai/utils/sized_box.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/text_style.dart';

class LiveStatusFriendsScreenComponents {
  Widget status({required Color bColor, required String text}) {
    return SizedBox(
      width: 60,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
                backgroundColor: bColor,
                radius: 30,
                child: CircleAvatar(
                    radius: 28,
                    backgroundImage:
                        AssetImage(AssetsImagesRoutes.avatar2Image))),
            5.sh,
            Text(text,
                textAlign: TextAlign.center,
                style: robotoStyle(
                    size: 12, weight: FontWeight.w400, color: kwhiteColor))
          ]),
    );
  }
}
