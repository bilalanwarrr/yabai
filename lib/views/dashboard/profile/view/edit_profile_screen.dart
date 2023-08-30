import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yabai/components/app_components.dart';
import 'package:yabai/utils/colors.dart';
import 'package:yabai/utils/sized_box.dart';

import '../../../../components/app_bar.dart';
import '../../../../components/textformfield.dart';
import '../../../../utils/const.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbackgroundColor,
      appBar: PreferredSize(
          preferredSize: appBarSize(context),
          child: MyAppBar(title: 'Edit Profile')),
      body: Container(
        height: height(context),
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
            child: Column(
          children: [
            MyTextField(validator: (v) {}, hint: 'Name'),
            20.sh,
            MyTextField(validator: (v) {}, hint: 'Email'),
            20.sh,
            AppComponents().button(text: 'Update', onTap: () {
              showReviewDialog(context,'You have made changes. Do you want to Discard or Save them?', 'Cancel', 'Save');
            })

          ],
        )),
      ),
    );
  }

  showReviewDialog(context, txt, btxt1, btxt2){
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
