import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yabai/utils/assets_routes.dart';
import 'package:yabai/utils/colors.dart';
import 'package:yabai/utils/const.dart';
import 'package:yabai/utils/sized_box.dart';
import 'package:yabai/views/auth/views/signup_screen.dart';

import '../../../../components/app_bar.dart';
import '../../../../components/app_components.dart';
import '../../../../components/textformfield.dart';
import '../../../../utils/text_style.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: colorOne,
        appBar: PreferredSize(
            preferredSize: appBarSize(context),
            child: MyAppBar(title: 'Change Password')),
        body: SingleChildScrollView(
            child: Container(
                height: height(context),
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      30.sh,
                      MyTextField(validator: (v) {}, hint: 'Current Password'),
                      20.sh,
                      MyTextField(validator: (v) {}, hint: 'New Password'),
                      20.sh,
                      MyTextField(
                          validator: (v) {}, hint: 'Confirm New Password'),
                      20.sh,
                      AppComponents().button(
                          text: 'Reset',
                          onTap: () {
                            showReviewDialog(
                                context,
                                'Are you sure to change Password?',
                                'Cancel',
                                'Save');
                            // Navigator.pushAndRemoveUntil(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) =>
                            //             SignupScreen()),
                            //     (route) => false);
                          })
                    ]))));
  }

  showReviewDialog(context, txt, btxt1, btxt2) {
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
}
