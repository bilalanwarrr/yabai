import 'package:flutter/material.dart';
import 'package:yabai/utils/sized_box.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/text_style.dart';

class InvitationScreenComponents {
  Widget userItem() {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Expanded(
          flex: 1,
          child: CircleAvatar(
              backgroundColor: kwhiteColor,
              radius: 30,
          backgroundImage: AssetImage('assets/images/avatar.png'),)),
      10.sw,
      Expanded(
          flex: 4,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            10.sh,
            Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Flexible(
                  fit: FlexFit.loose,
                  child: Text('Chris Thomas',
                      style: robotoStyle(
                          size: 14,
                          weight: FontWeight.w400,
                          color: kwhiteColor))),
              //  10.sw,
              const Spacer(),
              Text('11:32 am',
                  style: robotoStyle(
                      size: 12, weight: FontWeight.w400, color: kwhiteColor))
            ]),
            10.sh,
            Text('Coachella 2023',
                style: robotoStyle(
                    size: 14, weight: FontWeight.w400, color: kwhiteColor)),
          ]))
    ]);
  }
}
