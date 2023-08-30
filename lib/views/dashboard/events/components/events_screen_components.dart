import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yabai/components/textformfield.dart';
import 'package:yabai/utils/const.dart';
import 'package:yabai/utils/sized_box.dart';
import 'package:yabai/views/dashboard/notifications/view/notifications_screen.dart';

import '../../../../components/app_components.dart';
import '../../../../utils/assets_routes.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/text_style.dart';
import '../../../InviteUsersScreen.dart';

class EventsScreenComponents {
  Widget item(BuildContext context, {required Function() addMember}) {
    return GestureDetector(
      onLongPress: (){
        showLeaveDialog(context, 'Are you sure to leave this group?', 'Cancel', 'Yes');
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: const BoxDecoration(
            color: kwhiteColor,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('People I Live With',
                style: robotoStyle(
                    size: 14, weight: FontWeight.w400, color: kblackColor)),
            AppComponents().button(
                text: 'Add member',
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => InviteUsers()));
                },
                width: 110,
                fontSize: 12,
                height: 30,
                borderRadius: 30)
          ],
        ),
      ),
    );
  }

  showLeaveDialog(context, txt, btxt1, btxt2) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Wrap(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: kwhiteColor
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(txt,  textAlign: TextAlign.center, style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w400)),),
                      15.sh,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MaterialButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(btxt1,
                                style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: kwhiteColor))),
                            color: klightGreyColor,
                            elevation: 0.0,
                          ),
                          3.sw,
                          MaterialButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(btxt2,
                                  style: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: kwhiteColor))),
                              color: primaryColor,
                              elevation: 0.0)
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }

  Future<void> showMyDialog(BuildContext context) async {
    List<int> list = [];
    return showDialog<void>(
        context: context,
        // barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
                backgroundColor: kwhiteColor,
                title: Text('Copy Invite Link',
                    style: robotoStyle(
                        size: 20, weight: FontWeight.w700, color: kblackColor)),
                content: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children: [
                        Expanded(
                            child: MyTextField(
                                enabledBorderColor: kblackColor,
                                validator: (v) {},
                                hint: 'www.google.com',
                                enabled: true)),
                        5.sw,
                        AppComponents().button(
                            text: '',
                            onTap: () {},
                            width: 60,
                            height: 60,
                            child:
                                const Icon(Icons.copy, color: klightGreyColor),
                            color: kwhiteColor,
                            shadowColor: kwhiteColor,
                            borderColor: kblackColor)
                      ]),
                      10.sh,
                      Text('Invite People',
                          style: robotoStyle(
                              size: 16,
                              weight: FontWeight.w700,
                              color: kblackColor)),
                      10.sh,
                      SizedBox(
                          height: 120,
                          width: 300,
                          child: ListView.builder(
                              shrinkWrap: true,
                              padding: const EdgeInsets.all(0),
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: 10,
                              itemBuilder: (context, index) => Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            list.add(index);
                                            setState(() {});
                                          },
                                          child: CircleAvatar(
                                              radius: 40,
                                              backgroundImage: AssetImage(
                                                  AssetsImagesRoutes
                                                      .avatar2Image),
                                              child: !list.contains(index)
                                                  ? const SizedBox()
                                                  : CircleAvatar(
                                                      radius: 40,
                                                      backgroundColor:
                                                          kblackColor
                                                              .withOpacity(0.3),
                                                      child: const Icon(
                                                          Icons
                                                              .check_circle_outline_outlined,
                                                          color: kgreenColor,
                                                          size: 35))),
                                        ),
                                        Text(
                                          'Thomas \nWilson',
                                          textAlign: TextAlign.center,
                                          style: robotoStyle(
                                              size: 16,
                                              weight: FontWeight.w400,
                                              color: kblackColor),
                                        )
                                      ])))),
                      20.sh,
                    ]));
          });
        });
  }
}
