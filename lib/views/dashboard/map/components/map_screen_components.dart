import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yabai/utils/assets_routes.dart';
import 'package:yabai/utils/sized_box.dart';
import 'package:yabai/utils/text_style.dart';
import 'package:yabai/views/dashboard/events/view/events_screen.dart';
import 'package:yabai/views/dashboard/invitation/view/invitation_screen.dart';

import '../../../../utils/colors.dart';

class MapScreenComponents {
  List<String> selectedPrices = [];
  Future bottomSheet(BuildContext context) {
    return showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
            color: kbackgroundColor,
            padding: const EdgeInsets.all(10),
            height: 250,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  20.sh,
                  SizedBox(
                      height: 90,
                      child: ListView.builder(
                          shrinkWrap: true,
                          padding: const EdgeInsets.all(0),
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: 3,
                          itemBuilder: (context, index) => Container(
                              margin: const EdgeInsets.only(right: 10),
                              height: 90,
                              width: 120,
                              child:
                                  Image.asset(AssetsImagesRoutes.eventImage)))),
                  10.sh,
                  Row(
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              'Starbucks',
                              style: robotoStyle(
                                  size: 16,
                                  weight: FontWeight.w500,
                                  color: kwhiteColor),
                            ),
                            10.sh,
                            Row(children: [
                              Text('4.9',
                                  style: robotoStyle(
                                      size: 14,
                                      weight: FontWeight.w400,
                                      color: kwhiteColor)),
                              5.sw,
                              const Icon(Icons.star,
                                  color: kyellowColor, size: 12),
                              5.sw,
                              Text('(89)',
                                  style: robotoStyle(
                                      size: 14,
                                      weight: FontWeight.w400,
                                      color: kwhiteColor))
                            ]),
                            10.sh,
                            Row(
                              children: [
                                Text('2.3 Km',
                                    style: robotoStyle(
                                        size: 14,
                                        weight: FontWeight.w400,
                                        color: kwhiteColor)),
                                5.sw,
                                CircleAvatar(
                                  radius: 2,
                                  backgroundColor: Color.fromRGBO(103, 103, 103, 1),
                                ),
                                5.sw,
                                Text('14 min',
                                    style: robotoStyle(
                                        size: 14,
                                        weight: FontWeight.w400,
                                        color: kwhiteColor)),
                                10.sw,
                                Icon(Icons.car_crash_outlined, size: 18, color: kwhiteColor,)
                              ],
                            ),
                            10.sh,
                            Row(
                              children: [
                                Text('Open',
                                    style: robotoStyle(
                                        size: 14,
                                        weight: FontWeight.w400,
                                        color: kredColor)),
                                5.sw,
                                CircleAvatar(
                                  radius: 2,
                                  backgroundColor: Color.fromRGBO(103, 103, 103, 1),
                                ),
                                5.sw,
                                Text('3:00 PM',
                                    style: robotoStyle(
                                        size: 14,
                                        weight: FontWeight.w400,
                                        color: kwhiteColor)),
                              ],
                            ),
                          ]),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 30.0),
                          child: Row(
                            children: [
                              MaterialButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => InvitataionScreen()));
                                },
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    side: BorderSide(color: primaryColor)),
                                child: Text(
                                  'Create Event',
                                  style: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          color: primaryColor)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ));
      },
    );
  }

  Future priceBottomSheet(BuildContext context) {
    return showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          color: kbackgroundColor,
          padding: const EdgeInsets.all(10),
          height: 60,
          child: ListView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.all(0),
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: priceList.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                    margin: EdgeInsets.only(right: priceList[index].length -1 == index ? 0 : 10),
                    width: 60,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Center(
                      child: Text(
                        '\$${priceList[index]}',
                        style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: kwhiteColor)),
                      ),
                    )),
              )),
        );
      },
    );
  }
}

const priceList = ['500', '1000', '1500', '2000'];
