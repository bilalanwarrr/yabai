import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yabai/components/app_components.dart';
import 'package:yabai/utils/assets_routes.dart';
import 'package:yabai/utils/const.dart';
import 'package:yabai/utils/sized_box.dart';
import 'package:yabai/utils/text_style.dart';
import 'package:yabai/views/dashboard/events/components/events_screen_components.dart';
import 'package:yabai/views/dashboard/invitation/view/invitation_screen.dart';
import 'package:yabai/views/dashboard/live_status/view/live_status_friends_screen.dart';
import 'package:yabai/views/dashboard/live_status/view/live_status_screen.dart';

import '../../../../utils/colors.dart';
import '../../../InviteUsersScreen.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({super.key});

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen>
    with TickerProviderStateMixin {
  late TabController tabController;
  List<String> scheduleList = [today, upcoming, past];
  String selectedSchedule = today, selectedGoing = 'Coming Over';
  int selectedEvent = 0;
  bool showStatus = false, seeAll = false, isAdd = false;
  final quickStatusTxt = TextEditingController();

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 2);
    tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            backgroundColor: colorOne,
            appBar: AppBar(
                backgroundColor: knavyBlueColor,
                automaticallyImplyLeading: false,
                title: TabBar(
                    controller: tabController,
                    // dividerColor: primaryColor,
                    indicatorColor: primaryColor,
                    indicatorPadding:
                        const EdgeInsets.symmetric(horizontal: 20),
                    tabs: [
                      Container(
                          height: 22,
                          width: double.infinity,
                          padding: const EdgeInsets.all(0),
                          decoration: const BoxDecoration(
                              border: Border(
                                  right: BorderSide(
                                      color: primaryColor,
                                      width: 1,
                                      style: BorderStyle.solid))),
                          child: Center(
                              child: Text('My Events',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: robotoStyle(
                                      size: 14,
                                      weight: FontWeight.w500,
                                      color: tabController.index == 0
                                          ? primaryColor
                                          : kwhiteColor)))),
                      Tab(
                          child: Text('My Friends Groups',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: robotoStyle(
                                  size: 14,
                                  weight: FontWeight.w500,
                                  color: tabController.index == 1
                                      ? primaryColor
                                      : kwhiteColor)))
                    ])),
            body: TabBarView(controller: tabController, children: [
              Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        showStatus == true
                            ? Container(
                                margin: EdgeInsets.only(bottom: 10),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 8),
                                width: width(context),
                                decoration: BoxDecoration(
                                    color: kbackgroundColor,
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(color: primaryColor)),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      5.sh,
                                      GestureDetector(
                                        onTap: (){
                                          setState(() {
                                            selectedGoing = 'Here';
                                          });
                                        },
                                        child: Row(children: [
                                          Container(
                                              height: 10,
                                              width: 10,
                                              decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: kgreenColor)),
                                          10.sw,
                                          Text('Here',
                                              style: robotoStyle(
                                                  size: 12,
                                                  weight: FontWeight.w300,
                                                  color: kwhiteColor)),
                                          selectedGoing == 'Here' ? Padding(
                                            padding:  EdgeInsets.only(right: 10, left: 20),
                                            child: Icon(
                                              Icons.check,
                                              color: kwhiteColor,
                                              size: 18,
                                            ),
                                          ) : Container(),
                                        ]),
                                      ),
                                      20.sh,
                                      Row(children: [
                                       GestureDetector(
                                         onTap: (){
                                           setState(() {
                                             selectedGoing = 'Coming Over';
                                           });
                                         },
                                         child: Row(
                                           children: [
                                             Container(
                                                 height: 10,
                                                 width: 10,
                                                 decoration: const BoxDecoration(
                                                     shape: BoxShape.circle,
                                                     color: kyellowColor)),
                                             10.sw,
                                             Text('Coming Over',
                                                 style: robotoStyle(
                                                     size: 12,
                                                     weight: FontWeight.w300,
                                                     color: kwhiteColor)),
                                           ],
                                         ),
                                       ),
                                        // const Spacer(),
                                        selectedGoing == 'Coming Over' ? 30.sw :  40.sw,
                                        selectedGoing == 'Coming Over' ? Padding(
                                          padding:  EdgeInsets.only(right: 10),
                                          child: Icon(
                                            Icons.check,
                                            color: kwhiteColor,
                                            size: 18,
                                          ),
                                        ) : Container(),

                                        Expanded(
                                          child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 5,
                                                      vertical: 8),
                                              decoration: const BoxDecoration(
                                                  color: kwhiteColor,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(20))),
                                              child: Row(children: [
                                                Icon(
                                                  Icons.arrow_back,
                                                  color: klightGreyColor,
                                                  size: 18,
                                                ),
                                                5.sw,
                                                Expanded(
                                                    child: SizedBox(
                                                      height: 30,
                                                      child: TextField(
                                                        controller: quickStatusTxt,
                                                        decoration: InputDecoration(
                                                          border: InputBorder.none,
                                                          hintText:
                                                          'Quick Status Message',
                                                          contentPadding: EdgeInsets.only(top: -20),
                                                          hintStyle: robotoStyle(
                                                              size: 10,
                                                              weight: FontWeight.w400,
                                                              color: kblackColor),
                                                        ),
                                                      ),
                                                    )),
                                                5.sw,
                                                GestureDetector(
                                                  onTap: (){
                                                    setState(() {
                                                      quickStatusTxt.clear();
                                                    });
                                                  },
                                                  child: Icon(
                                                    Icons.close,
                                                    color: klightGreyColor,
                                                    size: 18,
                                                  ),
                                                ),
                                              ])),
                                        )
                                      ]),
                                      20.sh,
                                      GestureDetector(
                                        onTap: (){
                                          setState(() {
                                            selectedGoing = 'Won\'t Make It';
                                          });
                                        },
                                        child: Row(children: [
                                          Container(
                                              height: 10,
                                              width: 10,
                                              decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: kredColor)),
                                          10.sw,
                                          Text('Won\'t Make It',
                                              style: robotoStyle(
                                                  size: 12,
                                                  weight: FontWeight.w300,
                                                  color: kwhiteColor)),
                                          selectedGoing == 'Won\'t Make It' ? Padding(
                                            padding:  EdgeInsets.only(right: 10, left: 30),
                                            child: Icon(
                                              Icons.check,
                                              color: kwhiteColor,
                                              size: 18,
                                            ),
                                          ) : Container(),
                                        ]),
                                      ),
                                      10.sh,
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                showStatus = false;
                                              });
                                            },
                                            child: Text('Reset Status',
                                                style: robotoStyle(
                                                    size: 10,
                                                    weight: FontWeight.w500,
                                                    color: kwhiteColor)),
                                          ),
                                        ],
                                      ),
                                      5.sh
                                    ]))
                            : Container(),
                        seeAll == true
                            ? Container(
                                height: 150,
                                margin: EdgeInsets.symmetric(horizontal: 20),
                                padding: EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: knavyBlueColor),
                                child: GridView.builder(
                                    itemCount: 6,
                                    shrinkWrap: true,
                                    padding: EdgeInsets.zero,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 3,
                                            childAspectRatio: 0.75),
                                    itemBuilder: (context, index) {
                                      return Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            index == 0 ? 'Host' : '',
                                            style: GoogleFonts.roboto(
                                                textStyle: TextStyle(
                                                    fontSize: 12,
                                                    color: kwhiteColor)),
                                          ),
                                          index == 0 ? 5.sh : 0.sh,
                                          CircleAvatar(
                                            radius: 30,
                                            backgroundColor: index % 2 == 0
                                                ? kgreenColor.withOpacity(0.3)
                                                : kyellowColor.withOpacity(0.3),
                                            child: CircleAvatar(
                                              radius: 26,
                                              backgroundImage: AssetImage(
                                                  index % 2 == 0
                                                      ? AssetsImagesRoutes
                                                          .avatarImage
                                                      : AssetsImagesRoutes
                                                          .avatar2Image),
                                            ),
                                          ),
                                          5.sh,
                                          Text(
                                            '${index % 2 == 0 ? 'Here' : 'Hair day '}',
                                            style: GoogleFonts.roboto(
                                                textStyle: TextStyle(
                                                    fontSize: 12,
                                                    color: kwhiteColor)),
                                          ),
                                        ],
                                      );
                                    }),
                              )
                            : Container(),
                        10.sh,
                        SizedBox(
                            height: 30,
                            child: ListView.builder(
                                shrinkWrap: true,
                                padding: const EdgeInsets.all(0),
                                physics: const BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemCount: scheduleList.length,
                                itemBuilder: (context, index) => Container(
                                    margin: const EdgeInsets.only(right: 10),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    decoration: BoxDecoration(
                                        color: selectedSchedule ==
                                                scheduleList[index]
                                            ? primaryColor
                                            : knavyBlueColor,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(20))),
                                    child: Center(
                                        child: InkWell(
                                            onTap: () {
                                              selectedSchedule =
                                                  scheduleList[index];
                                              selectedEvent = 0;
                                              setState(() {});
                                            },
                                            child: Text(
                                              scheduleList[index],
                                              style: robotoStyle(
                                                  size: 14,
                                                  weight: FontWeight.w500,
                                                  color: kwhiteColor),
                                            )))))),
                        20.sh,
                        Expanded(
                            child: ListView.builder(
                                shrinkWrap: true,
                                padding: const EdgeInsets.all(0),
                                physics: const BouncingScrollPhysics(),
                                itemCount: 13,
                            itemBuilder: (context, index){
                              return Padding(padding: EdgeInsets.only(bottom: 20), child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                      flex: 2,
                                      child: GestureDetector(
                                          onTap: () {
                                            selectedEvent = index;
                                            setState(() {});
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        InvitataionScreen()));
                                          },
                                          child: Container(
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: 10, vertical: 10),
                                              decoration: BoxDecoration(
                                                  color: selectedEvent == index
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
                                                                          color: selectedEvent != index

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
                                                        onTap: (){
                                                          setState(() {
                                                            showStatus = !showStatus;
                                                            seeAll = false;
                                                          });
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
                                                              selectedEvent == index
                                                                   ? 'Going' : 'Maybe',
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
                                            onTap: () {

                                              setState(() {
                                                showStatus = !showStatus;
                                                seeAll = false;
                                              });
                                            },
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
                                            onTap: () {
                                              setState(() {
                                                seeAll = !seeAll;
                                                showStatus = false;
                                              });
                                            },
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
                              ),);
                            }
                            )),
                        // Expanded(
                        //     child: ListView.builder(
                        //         shrinkWrap: true,
                        //         padding: const EdgeInsets.all(0),
                        //         physics: const BouncingScrollPhysics(),
                        //         itemCount: 13,
                        //         itemBuilder: (context, index) {
                        //           return Padding(
                        //               padding:
                        //                   const EdgeInsets.only(bottom: 20.0),
                        //               child: AppComponents().eventItem(context,
                        //                   index,
                        //                   selectedSchedule: selectedSchedule,
                        //                   onProfileTap: () {
                        //                     setState(() {
                        //                       showStatus = !showStatus;
                        //                       seeAll = false;
                        //                     });
                        //                   },
                        //                   onSeeAllTap: () {
                        //                     setState(() {
                        //                       seeAll = !seeAll;
                        //                       showStatus = false;
                        //                     });
                        //                     // Navigator.push(
                        //                     //     context,
                        //                     //     MaterialPageRoute(
                        //                     //         builder: (context) =>
                        //                     //             LiveStatusScreen()));
                        //                   },
                        //                   onContainerTap: () {
                        //                     selectedEvent = index;
                        //                     setState(() {});
                        //                     Navigator.push(
                        //                         context,
                        //                         MaterialPageRoute(
                        //                             builder: (context) =>
                        //                                 InvitataionScreen()));
                        //                   },
                        //                   selected: selectedEvent == index
                        //                       ? true
                        //                       : false));
                        //         }))
                      ])),
              SingleChildScrollView(
                child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(children: [
                      ListView.builder(
                          shrinkWrap: true,
                          padding: const EdgeInsets.all(0),
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 9,
                          itemBuilder: (context, index) =>
                              EventsScreenComponents().item(context,
                                  addMember: () {
                                EventsScreenComponents().showMyDialog(context);
                              })),
                      isAdd == true
                          ? Column(
                              children: [
                                10.sh,
                                Container(
                                  margin: const EdgeInsets.only(bottom: 10),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10),
                                  decoration: const BoxDecoration(
                                      color: kwhiteColor,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Name your group',
                                          style: robotoStyle(
                                              size: 14,
                                              weight: FontWeight.w400,
                                              color: kblackColor)),
                                      AppComponents().button(
                                          text: 'Add member',
                                          onTap: () {},
                                          width: 110,
                                          fontSize: 12,
                                          height: 30,
                                          borderRadius: 30)
                                    ],
                                  ),
                                ),
                                10.sh,
                              ],
                            )
                          : Container(),
                      10.sh,
                      Row(children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isAdd = !isAdd;
                            });
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) =>
                            //             LiveStatusFriendsScreen()));
                          },
                          child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle, color: primaryColor),
                              child: const Icon(
                                Icons.add,
                                color: kwhiteColor,
                                size: 30,
                              )),
                        )
                      ]),
                      60.sh,
                    ])),
              )
            ])));
  }
}
