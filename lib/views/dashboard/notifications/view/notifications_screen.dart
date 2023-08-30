import 'package:flutter/material.dart';
import 'package:yabai/utils/colors.dart';
import 'package:yabai/utils/sized_box.dart';
import 'package:yabai/utils/text_style.dart';

import '../../../../components/app_bar.dart';
import '../../../../utils/const.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: colorOne,
        appBar: PreferredSize(
            preferredSize: appBarSize(context),
            child: MyAppBar(title: 'Notifications')),
        body: Container(
            height: height(context),
            padding: const EdgeInsets.all(20),
            child: Column(children: [
              Expanded(
                child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: 16,
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.all(0),
                    separatorBuilder: (context, index){
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        child: Divider(indent: 60,
                            color: kwhiteColor, thickness: 1),
                      );
                    },
                    itemBuilder: (context, index) => Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: CircleAvatar(
                                      backgroundColor: kwhiteColor,
                                      radius: 25,
                                      backgroundImage: AssetImage(index % 2 == 0 ? 'assets/images/avatar.png' : 'assets/images/avatar2.png'),
                                      )),
                              10.sw,
                              Expanded(
                                  flex: 4,
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        10.sh,
                                        Text('Chris Thomas commented in event',
                                            style: robotoStyle(
                                                size: 14,
                                                weight: FontWeight.w500,
                                                color: kwhiteColor)),
                                        5.sh,
                                        Text('Coachella 2023',
                                            style: robotoStyle(
                                                size: 14,
                                                weight: FontWeight.w500,
                                                color: primaryColor)),
                                      ]))
                            ])),
              )
            ])));
  }
}
