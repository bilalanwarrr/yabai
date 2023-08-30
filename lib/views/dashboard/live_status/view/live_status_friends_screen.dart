import 'package:flutter/material.dart';
import 'package:yabai/components/app_components.dart';
import 'package:yabai/utils/colors.dart';
import 'package:yabai/utils/const.dart';
import 'package:yabai/utils/sized_box.dart';
import 'package:yabai/utils/text_style.dart';

import '../../events/components/events_screen_components.dart';
import '../../profile/view/profile_screen.dart';
import '../components/live_status_friends_screen_components.dart';

class LiveStatusFriendsScreen extends StatefulWidget {
  const LiveStatusFriendsScreen({super.key});

  @override
  State<LiveStatusFriendsScreen> createState() =>
      _LiveStatusFriendsScreenState();
}

class _LiveStatusFriendsScreenState extends State<LiveStatusFriendsScreen> {
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
                        bottomRight: Radius.circular(15.0))),
                child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    width: width(context),
                    decoration: const BoxDecoration(
                        color: kbackgroundColor,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(15.0),
                            bottomRight: Radius.circular(15.0))),
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      decoration: const BoxDecoration(
                          color: knavyBlueColor,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Column(children: [
                        20.sh,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            LiveStatusFriendsScreenComponents()
                                .status(bColor: kgreenColor, text: 'Thomas'),
                            LiveStatusFriendsScreenComponents()
                                .status(bColor: kyellowColor, text: 'Thomas'),
                            LiveStatusFriendsScreenComponents()
                                .status(bColor: kgreenColor, text: 'Thomas'),
                            LiveStatusFriendsScreenComponents()
                                .status(bColor: kgreenColor, text: 'Thomas'),
                          ],
                        ),
                        10.sh,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            LiveStatusFriendsScreenComponents()
                                .status(bColor: kredColor, text: 'Thomas'),
                            LiveStatusFriendsScreenComponents()
                                .status(bColor: kgreenColor, text: 'Thomas'),
                            LiveStatusFriendsScreenComponents()
                                .status(bColor: kgreenColor, text: 'Thomas'),
                            LiveStatusFriendsScreenComponents()
                                .status(bColor: kgreenColor, text: 'Thomas'),
                          ],
                        ),
                        10.sh,
                      ]),
                    ))),
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
                    }))
          ],
        ),
      ),
    );
  }
}
