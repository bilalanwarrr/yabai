import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:yabai/components/textformfield.dart';
import 'package:yabai/utils/assets_routes.dart';
import 'package:yabai/utils/colors.dart';
import 'package:yabai/utils/const.dart';
import 'package:yabai/utils/sized_box.dart';
import 'package:yabai/utils/text_style.dart';
import 'package:yabai/views/InviteUsersScreen.dart';
import 'package:yabai/views/dashboard/invitation/component/invitation_screen_components.dart';

import '../../../../provider/custom_provider.dart';

class InvitataionScreen extends StatefulWidget {
  const InvitataionScreen({super.key});

  @override
  State<InvitataionScreen> createState() => _InvitataionScreenState();
}

class _InvitataionScreenState extends State<InvitataionScreen> {
  String date = '', startTime = '', endTime = '';
  bool isDone = false;
  final startTimeTxt = TextEditingController();
  final endTimeTxt = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorOne,
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 10.0, right: 10, bottom: 10),
        child: MyTextField(
          validator: (v) {},
          borderRadius: 20,
          hint: 'Message',
          suffix:
              const Icon(Icons.emoji_emotions_outlined, color: primaryColor),
        ),
      ),
      body: SizedBox(
        height: height(context),
        width: width(context),
        child: Column(
          children: [
            Stack(children: [
              Image.asset(AssetsImagesRoutes.eventImage,
                  fit: BoxFit.cover, height: 200, width: double.infinity,),
              Positioned(
                  top: 30,
                  left: 20,
                  child: InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        height: 40,
                        width: 40,
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        padding: const EdgeInsets.all(5),
                        decoration: const BoxDecoration(
                            color: kdarkGreyColor, shape: BoxShape.circle),
                        child: const Icon(Icons.arrow_back_rounded,
                            color: primaryColor, size: 20),
                      )))
            ]),
            6.sh,
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    Row(children: [
                      Text('Starbucks ',
                          style: robotoStyle(
                              size: 16,
                              weight: FontWeight.w500,
                              color: kwhiteColor)),
                      const Spacer(),
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
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(15))),
                            child: Text('Invite',
                                style: robotoStyle(
                                    size: 12,
                                    weight: FontWeight.w400,
                                    color: primaryColor))),
                      ),
                      10.sw,
                      Image.asset(AssetsIconsRoutes.editIcon, height: 20)
                    ]),
                    5.sh,
                    Row(children: [
                      Text('4.1',
                          style: robotoStyle(
                              size: 14,
                              weight: FontWeight.w400,
                              color: kwhiteColor)),
                      const Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 15,
                      ),
                      Text('18.5k',
                          style: robotoStyle(
                              size: 14,
                              weight: FontWeight.w400,
                              color: kwhiteColor)),
                      const Spacer(),
                      Text('Kendall Hailey',
                          style: robotoStyle(
                              size: 14,
                              weight: FontWeight.w400,
                              color: kwhiteColor)),
                      10.sw,
                      GestureDetector(
                          onTap: () {
                            cancelEvent();
                          },
                          child: Image.asset(AssetsIconsRoutes.closeIcon,
                              height: 20))
                    ]),
                    10.sh,
                    Row(children: [
                      Expanded(
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () async {
                                var msg = await showCalendarDatePicker2Dialog(
                                  context: context,
                                  config:
                                      CalendarDatePicker2WithActionButtonsConfig(),
                                  dialogSize: const Size(325, 400),
                                  borderRadius: BorderRadius.circular(15),
                                );

                                if (msg != null) {
                                  setState(() {
                                    date = DateFormat.yMMMMd('en_US').format(msg.first!);
                                  });
                                }
                              },
                              child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 2, horizontal: 10),
                                  decoration: const BoxDecoration(
                                      color: primaryColor,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text('${date.isEmpty ? 'Date' : date}',
                                            style: robotoStyle(
                                                size: 12,
                                                weight: FontWeight.w500,
                                                color: kwhiteColor)),
                                        const Icon(
                                            Icons.keyboard_arrow_down_outlined,
                                            color: kwhiteColor)
                                      ])),
                            ),
                            10.sw,
                            GestureDetector(
                              onTap: () async {
                                selectTime(context);
                                // var msg = await showTimePicker(
                                //   context: context,
                                //   initialTime: TimeOfDay.now(),
                                // );
                                //
                                // if (msg != null) {
                                //   setState(() {
                                //     time =
                                //         '${(msg.hour % 12).toString().length == 1 ? '0${msg.hour % 12}' : msg.hour % 12}:${msg.minute.toString().length == 1 ? '0${msg.minute}' : msg.minute}';
                                //   });
                                // }
                              },
                              child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 2, horizontal: 10),
                                  decoration: const BoxDecoration(
                                      color: primaryColor,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text('${startTime.isEmpty ? 'Time' : '${startTime}${endTime.isNotEmpty ? '-${endTime}' : ''}'}',
                                            style: robotoStyle(
                                                size: 12,
                                                weight: FontWeight.w500,
                                                color: kwhiteColor)),
                                        const Icon(
                                            Icons.keyboard_arrow_down_outlined,
                                            color: kwhiteColor)
                                      ])),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          var customPro = Provider.of<CustomProvider>(context, listen: false);
                          setState(() {
                            isDone = !isDone;
                          });
                          if(isDone == true){
                            Navigator.pop(context);
                            tabController!.animateTo(2);
                            customPro.setIndex(2);
                          }
                        },
                        child: Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.lightGreen)),
                          child: Center(
                            child: isDone == true ? Icon(
                              Icons.done,
                              color: Colors.lightGreen,
                              size: 18,
                            ) : Container(),
                          ),
                        ),
                      )
                    ]),
                    8.sh,
                    Row(children: [
                      const Icon(Icons.access_time, color: kwhiteColor),
                      10.sw,
                      Text('in 30 days',
                          style: robotoStyle(
                              size: 14,
                              weight: FontWeight.w400,
                              color: kwhiteColor))
                    ]),
                    5.sh,
                    Row(children: [
                      const Icon(Icons.group_outlined, color: kwhiteColor),
                      10.sw,
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 2,
                            backgroundColor: Color.fromRGBO(103, 103, 103, 1),
                          ),
                          5.sw,
                          Text('5 Going',
                              style: robotoStyle(
                                  size: 14,
                                  weight: FontWeight.w400,
                                  color: kwhiteColor)),
                        ],
                      ),
                      10.sw,
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 2,
                            backgroundColor: Color.fromRGBO(103, 103, 103, 1),
                          ),
                          5.sw,
                          Text('0 Pass',
                              style: robotoStyle(
                                  size: 14,
                                  weight: FontWeight.w400,
                                  color: kwhiteColor)),
                        ],
                      ),
                      10.sw,
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 2,
                            backgroundColor: Color.fromRGBO(103, 103, 103, 1),
                          ),
                          5.sw,
                          Text('1 Maybe',
                              style: robotoStyle(
                                  size: 14,
                                  weight: FontWeight.w400,
                                  color: kwhiteColor)),
                        ],
                      )
                    ]),
                    8.sh,
                    SizedBox(height: 45, child: MyTextField(hint: 'Bieber Concert', validator: (v) {}, borderRadius: 30, filled: true, fillColor: Colors.transparent, enabledBorderColor: primaryColor, hintColor: kwhiteColor,)),
                    // Container(
                    //     width: double.infinity,
                    //     padding: const EdgeInsets.symmetric(
                    //         vertical: 15, horizontal: 10),
                    //     decoration: BoxDecoration(
                    //         border: Border.all(color: primaryColor),
                    //         borderRadius:
                    //             const BorderRadius.all(Radius.circular(25))),
                    //     child: Text('Bieber Concert',
                    //         style: robotoStyle(
                    //             size: 12,
                    //             weight: FontWeight.w400,
                    //             color: primaryColor))),
                    10.sh,
                    Expanded(
                      child: ListView.separated(
                          shrinkWrap: true,
                          itemCount: 16,
                          physics: const BouncingScrollPhysics(),
                          padding: const EdgeInsets.all(0),
                          separatorBuilder: (context, index){
                            return        Padding(
                              padding:  EdgeInsets.only(top: 12, bottom: 12, left: 40),
                              child: Divider(color: kwhiteColor, thickness: 1.5),
                            );
                          },
                          itemBuilder: (context, index) =>
                              InvitationScreenComponents().userItem()),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  selectTime(context) {
    bool isAdd = false;

    showDialog(
        context: context,
        builder: (context) {
            return StatefulBuilder(builder: (context, setState){
              return Dialog(
                backgroundColor: kwhiteColor,
                child: Wrap(
                  children: [
                    Container(
                      padding:
                      EdgeInsets.symmetric(horizontal: 18, vertical: 15),
                      child: Column(
                        children: [
                          Text(
                            'Select Time',
                            style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    color: kblackColor)),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10, bottom: 15),
                            child: Divider(
                              color: colorOne,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                'Start Time:',
                                style: GoogleFonts.sourceSansPro(
                                    textStyle: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: kblackColor)),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              GestureDetector(
                                onTap: () async {
                                  var msg = await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                  );

                                  if (msg != null) {
                                    print(msg.period.name);
                                    setState(() {
                                      startTimeTxt.text =
                                      '${(msg.hour % 12).toString().length == 1 ? '0${msg.hour % 12}' : msg.hour % 12}:${msg.minute.toString().length == 1 ? '0${msg.minute}' : msg.minute} ${msg.period.name.toUpperCase()}';
                                    });
                                  }
                                },
                                child: SizedBox(
                                  height: 45,
                                  width: 120,
                                  child: TextField(
                                    controller: startTimeTxt,
                                    style: GoogleFonts.roboto(
                                        textStyle: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16,
                                            color: kblackColor)),
                                    textAlign: TextAlign.center,
                                    enabled: false,
                                    decoration: InputDecoration(
                                      disabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide: BorderSide(color: colorTwo)
                                      ),
                                      contentPadding: EdgeInsets.symmetric(vertical: -7),
                                      hintText: '00',
                                      hintStyle: GoogleFonts.roboto(
                                          textStyle: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16,
                                              color: kblackColor)),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                'End Time:',
                                style: GoogleFonts.sourceSansPro(
                                    textStyle: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: kblackColor)),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              isAdd == true ?
                              GestureDetector(
                                onTap: () async {
                                  var msg = await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                  );

                                  if (msg != null) {
                                    setState(() {
                                      endTimeTxt.text =
                                      '${(msg.hour % 12).toString().length == 1 ? '0${msg.hour % 12}' : msg.hour % 12}:${msg.minute.toString().length == 1 ? '0${msg.minute}' : msg.minute} ${msg.period.name.toUpperCase()}';
                                    });
                                  }
                                },
                                child: SizedBox(
                                  height: 45,
                                  width: 120,
                                  child: TextField(
                                    controller: endTimeTxt,
                                    enabled: false,
                                    style: GoogleFonts.roboto(
                                        textStyle: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16,
                                            color: kblackColor)),
                                    textAlign: TextAlign.center,

                                    decoration: InputDecoration(
                                      disabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide: BorderSide(color: colorTwo)
                                      ),
                                      contentPadding: EdgeInsets.symmetric(vertical: -7),
                                      hintText: '00',
                                      hintStyle: GoogleFonts.roboto(
                                          textStyle: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16,
                                              color: kblackColor)),
                                    ),
                                  ),
                                ),
                              ):
                              GestureDetector(
                                onTap: (){
                                  setState(() {
                                    isAdd = true;
                                  });
                                },
                                child: Row(
                                  children: [
                                    Text('Add End Time?',  style: GoogleFonts.sourceSansPro(
                                        textStyle: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            color: kblackColor)),),
                                    5.sw,
                                    Icon(Icons.add_circle_outline),
                                  ],
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          MaterialButton(
                            onPressed: () async {
                              Navigator.pop(context, [startTimeTxt.text, endTimeTxt.text]);
                            },
                            minWidth: 140,
                            height: 50,
                            child: Text(
                              'Select',
                              style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: kwhiteColor)),
                            ),
                            color: colorOne,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                                side: BorderSide(color: colorOne)),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
            },);

        }).then((value) {
          if(value != null){
            setState(() {
              print([value[0], value[1]]);
              startTime = value[0];
              endTime = value[1];
            });
          }
    });
  }

  cancelEvent() {
    showDialog<void>(
      context: context,
      builder: (BuildContext dialogContext) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Wrap(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
                decoration: BoxDecoration(
                    color: knavyBlueColor,
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  children: [
                    Text(
                      'Are you sure you want to cancel this event?',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: kwhiteColor)),
                    ),
                    20.sh,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: MaterialButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            color: primaryColor,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                            child: Text(
                              'No',
                              style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: kwhiteColor)),
                            ),
                          ),
                        ),
                        15.sw,
                        Expanded(
                          child: MaterialButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            color: primaryColor,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                            child: Text(
                              'Yes',
                              style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: kwhiteColor)),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}



