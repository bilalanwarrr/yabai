import 'package:flutter/material.dart';
import 'package:yabai/components/app_components.dart';
import 'package:yabai/utils/colors.dart';
import 'package:yabai/utils/const.dart';
import 'package:yabai/utils/sized_box.dart';
import 'package:yabai/utils/text_style.dart';

import '../../../../utils/assets_routes.dart';
import '../../events/components/events_screen_components.dart';
import '../../profile/view/profile_screen.dart';

class LiveStatusScreen extends StatefulWidget {
  const LiveStatusScreen({super.key});

  @override
  State<LiveStatusScreen> createState() => _LiveStatusScreenState();
}

class _LiveStatusScreenState extends State<LiveStatusScreen> {
  int selectedEvent = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbackgroundColor,
      body: SizedBox(
        height: height(context),
        child: Column(
          children: [
            40.sh,
            Container(
              width: width(context),
              padding: const EdgeInsets.only(left: 1, bottom: 1, right: 1),
              decoration: const BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15.0),
                  bottomRight: Radius.circular(15.0),
                ),
              ),
              child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  width: width(context),
                  decoration: const BoxDecoration(
                    color: kbackgroundColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15.0),
                      bottomRight: Radius.circular(15.0),
                    ),
                  ),
                  child: Column(children: [
                    Row(children: [
                      Container(
                          height: 10,
                          width: 10,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: kgreenColor)),
                      10.sw,
                      Text('Here',
                          style: robotoStyle(
                              size: 12,
                              weight: FontWeight.w300,
                              color: kwhiteColor))
                    ]),
                    20.sh,
                    Row(children: [
                      Container(
                          height: 10,
                          width: 10,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: kyellowColor)),
                      10.sw,
                      Text('Coming Over',
                          style: robotoStyle(
                              size: 12,
                              weight: FontWeight.w300,
                              color: kwhiteColor)),
                      const Spacer(),
                      const Icon(Icons.check, color: kwhiteColor),
                      10.sw,
                      Container(
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                              color: kwhiteColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Row(children: [
                            const Icon(Icons.arrow_back,
                                color: klightGreyColor),
                            Text('Stuck in traffic, ughh',
                                style: robotoStyle(
                                    size: 12,
                                    weight: FontWeight.w400,
                                    color: kblackColor)),
                            20.sw,
                            const Icon(Icons.close, color: klightGreyColor),
                          ]))
                    ]),
                    20.sh,
                    Row(children: [
                      Container(
                          height: 10,
                          width: 10,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: kredColor)),
                      10.sw,
                      Text('Won\'t Make It ',
                          style: robotoStyle(
                              size: 12,
                              weight: FontWeight.w300,
                              color: kwhiteColor))
                    ]),
                    10.sh
                  ])),
            ),
            20.sh,

            Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(0),
                    physics: const BouncingScrollPhysics(),
                    itemCount: 13,
                    itemBuilder: (context, index) {
                      return Padding(
                          padding:
                          const EdgeInsets.only(bottom: 20.0, left: 20),
                          child: AppComponents().eventItem(context,
                              index,
                              onProfileTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ProfileScreen()));
                              },
                              onSeeAllTap: () {},
                              onContainerTap: () {
                                selectedEvent = index;
                                setState(() {});
                              },
                              selected: selectedEvent == index ? true : false));
                    })
            )
          ],
        ),
      ),
    );
  }
}
