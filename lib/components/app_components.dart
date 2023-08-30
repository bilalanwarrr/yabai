import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:yabai/utils/sized_box.dart';
import 'package:yabai/utils/text_style.dart';
import 'package:yabai/views/InviteUsersScreen.dart';

import '../utils/assets_routes.dart';
import '../utils/colors.dart';
import '../utils/const.dart';

class AppComponents {
  Widget richText(
      {required String greyText,
      required String primaryText,
      required void Function()? onTap}) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      RichText(
          text: TextSpan(
              text: greyText,
              style: robotoStyle(
                  size: 14, weight: FontWeight.w600, color: kwhiteColor),
              children: [
            TextSpan(
                text: ' $primaryText',
                style: robotoStyle(
                    size: 14, weight: FontWeight.w600, color: klightPinkColor),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    onTap!();
                  })
          ]))
    ]);
  }

  Widget eventItem(BuildContext context, index,
      {required bool selected,
      required Function onContainerTap,
      required Function onProfileTap,
      required Function onSeeAllTap,
      String selectedSchedule = today}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            flex: 2,
            child: GestureDetector(
                onTap: () => onContainerTap(),
                child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                        color: selected
                            ? primaryColor
                            : knavyBlueColor, //primaryColor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20))),
                    child: Column(
                      children: [
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                  flex: 3,
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        10.sh,
                                        Text('Snowboarding',
                                            style: robotoStyle(
                                                size: 14,
                                                weight: FontWeight.w500,
                                                color: !selected
                                                    ? primaryColor
                                                    : knavyBlueColor)),
                                        10.sh,
                                        Text('60 Chelsea Piers \n7:30 am',
                                            style: robotoStyle(
                                                size: 13,
                                                weight: FontWeight.w500,
                                                color: kwhiteColor)),
                                        selectedSchedule == today
                                            ? Text('Sat. Jan 28 ',
                                                style: robotoStyle(
                                                    size: 13,
                                                    weight: FontWeight.w500,
                                                    color: kwhiteColor))
                                            : const SizedBox(),
                                      ])),
                              Expanded(
                                  flex: 2,
                                  child: Column(children: [
                                    Image.asset(AssetsImagesRoutes.eventImage,
                                        height: 65, width: 85),
                                  ]))
                            ]),
                        10.sh,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap: (){},
                              child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 5),
                                  decoration: BoxDecoration(
                                      color: kbackgroundColor,
                                      border: Border.all(color: primaryColor),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(15))),
                                  child: Text(
                                    selected == true ? 'Going' : 'Maybe',
                                    style: robotoStyle(
                                        size: 12,
                                        weight: FontWeight.w400,
                                        color: primaryColor),
                                  )),
                            ),
                            const SizedBox(),
                            GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => InviteUsers()));
                              },
                              child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 5),
                                  decoration: BoxDecoration(
                                      color: kbackgroundColor,
                                      border: Border.all(color: primaryColor),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(15))),
                                  child: Text(
                                    'Invite',
                                    style: robotoStyle(
                                        size: 12,
                                        weight: FontWeight.w400,
                                        color: primaryColor),
                                  )),
                            )
                          ],
                        )
                      ],
                    )))),
        Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                index == 0 ? Column(
                  children: [
                    Text('Live Status',
                        style: robotoStyle(
                            size: 12, weight: FontWeight.w400, color: kwhiteColor)),
                    10.sh,
                  ],
                ) : Container(),
                GestureDetector(
                  onTap: () => onProfileTap(),
                  child: CircleAvatar(
                    radius: 32,
                    backgroundColor: primaryColor,
                    child: CircleAvatar(
                      foregroundColor: colorTwo,
                      // backgroundColor: colorOne,
                      //   foregroundColor: primaryColor,
                        backgroundImage:
                            AssetImage(AssetsImagesRoutes.avatarImage),
                        radius: 30),
                  ),
                ),
                10.sh,
                GestureDetector(
                  onTap: () => onSeeAllTap(),
                  child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
                      decoration: BoxDecoration(
                          color: kbackgroundColor,
                          border: Border.all(color: primaryColor),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15))),
                      child: Text(
                        'See all',
                        style: robotoStyle(
                            size: 12,
                            weight: FontWeight.w400,
                            color: primaryColor),
                      )),
                )
              ],
            ))
      ],
    );
  }

  Widget button(
      {required String text,
      required Function()? onTap,
      double height = 50,
      double width = double.infinity,
      double borderRadius = 10,
      Color color = primaryColor,
      Color borderColor = primaryColor,
      Color textColor = kwhiteColor,
      Color? shadowColor,
      int fontSize = 18,
      Widget? child}) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 4),
                spreadRadius: 1,
                blurRadius: 2,
                color: shadowColor ?? primaryColor.withOpacity(0.2))
          ],
          color: color,
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.all(Radius.circular(borderRadius))),
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(Colors.transparent),
            shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.all(Radius.circular(borderRadius))))),
        child: child ??
            Text(
              text,
              style: robotoStyle(
                  size: fontSize, weight: FontWeight.w500, color: textColor),
            ),
        onPressed: () => onTap!(),
      ),
    );
  }
}
