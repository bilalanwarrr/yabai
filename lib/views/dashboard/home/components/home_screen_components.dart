import 'package:flutter/material.dart';
import 'package:yabai/components/app_components.dart';
import 'package:yabai/components/textformfield.dart';
import 'package:yabai/utils/colors.dart';
import 'package:yabai/utils/sized_box.dart';
import 'package:yabai/utils/text_style.dart';

import '../../../../utils/const.dart';

class HomeScreenComponents {
  Future<void> showMyDialog(BuildContext context) async {
    bool value = false;
    return showDialog<void>(
        context: context,
        // barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
                backgroundColor: kbackgroundColor,
                title: Text('My Location',
                    textAlign: TextAlign.center,
                    style: robotoStyle(
                        size: 18, weight: FontWeight.w500, color: kwhiteColor)),
                content: Column(mainAxisSize: MainAxisSize.min, children: [
                  MyTextField(validator: (v) {}, hint: 'Search'),
                  // 10.sh,
                  // MyTextField(validator: (v) {}, hint: 'Address'),
                  10.sh,
                  Container(
                      color: kwhiteColor,
                      child: SwitchListTile(
                          selected: true,
                          value: isLocation,
                          onChanged: (v) {
                            isLocation = v;
                            setState(() {});
                          },
                          title: Text('Use Current Location',
                              style: robotoStyle(
                                  size: 12,
                                  weight: FontWeight.w400,
                                  color: kblackColor)))),
                  10.sh,
                  AppComponents().button(text: 'Done', onTap: () {
                    Navigator.pop(context);
                  })
                ]));
          });
        });
  }
}
