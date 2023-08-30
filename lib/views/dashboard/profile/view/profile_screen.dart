import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yabai/components/app_bar.dart';
import 'package:yabai/components/app_components.dart';
import 'package:yabai/utils/colors.dart';
import 'package:yabai/utils/sized_box.dart';
import 'package:yabai/utils/text_style.dart';
import 'package:yabai/views/dashboard/profile/components/profile_screen_components.dart';
import 'package:yabai/views/dashboard/profile/view/change_password_screen.dart';
import 'package:yabai/views/dashboard/profile/view/edit_profile_screen.dart';

import '../../../../utils/const.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? image;

  Future selectImage(ImageSource source) async {
    try {
      final selected = await ImagePicker().pickImage(source: source);
      if (selected != null) {
        image = File(selected.path);
        setState(() {});
      }
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: colorOne,
        appBar: PreferredSize(
            preferredSize: appBarSize(context),
            child: MyAppBar(title: 'Profile')),
        body: SingleChildScrollView(
          child: Container(
            height: height(context) - 80,
            width: width(context),
            padding: const EdgeInsets.all(20),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  10.sh,
                  ProfileScreenComponents().item(text: 'Danny Nguyen'),
                  20.sh,
                  ProfileScreenComponents().item(text: 'dannynguyen@'),
                  20.sh,
                  AppComponents().button(
                      text: 'Change Password',
                      borderRadius: 15,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChangePasswordScreen()));
                      },
                      fontSize: 12,
                      height: 30,
                      width: 180),
                  const Spacer(),
                  image != null
                      ? Stack(children: [
                          CircleAvatar(
                              backgroundColor: kblackColor,
                              radius: 50,
                              backgroundImage: FileImage(image!, scale: 0.5)),
                          Positioned(
                              bottom: 0,
                              right: 5,
                              child: GestureDetector(
                                onTap: () {
                                  // showBottomSheet(context);
                                  image = null;
                                  setState(() {});
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: kwhiteColor),
                                  child: const Icon(
                                    Icons.close,
                                    color: kblackColor,
                                  ),
                                ),
                              ))
                        ])
                      : Stack(children: [
                          Container(
                              padding: const EdgeInsets.all(20),
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Color(0xffFFFFFF),
                                        Color(0xffFBB0CF)
                                      ])),
                              child: const Icon(Icons.person_outline_rounded,
                                  color: primaryColor, size: 50)),
                          Positioned(
                              bottom: 0,
                              right: 5,
                              child: GestureDetector(
                                  onTap: () {
                                    showBottomSheet(context);
                                  },
                                  child: Container(
                                      padding: const EdgeInsets.all(5),
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: kwhiteColor),
                                      child: const Icon(
                                        Icons.camera_alt,
                                        color: kblackColor,
                                      ))))
                        ]),
                  30.sh,
                  AppComponents().button(
                      text: 'Change Profile',
                      borderRadius: 15,
                      onTap: () async {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EditProfileScreen()));
                      },
                      fontSize: 12,
                      height: 30,
                      width: 180),
                  const Spacer(),
                  AppComponents().button(
                      text: 'Sign out',
                      onTap: () {
                        // You have made changes. Do you want to Discard or Save them?
                        showReviewDialog('Are you sure you want to sign out?', 'Cancel', 'Sign Out');
                      },
                      borderRadius: 40,
                      height: 40),
                  10.sh,
                  GestureDetector(
                    onTap: (){
                      showReviewDialog('Are you sure you want to Delete Account?', 'Cancel', 'Delete');
                    },
                    child: Text('Delete Account',
                        style: robotoStyle(
                            color: primaryColor,
                            size: 16,
                            weight: FontWeight.w500)),
                  ),
                  50.sh
                ]),
          ),
        ));
  }

  void showBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      backgroundColor: knavyBlueColor,
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ListTile(
              title: Text(
                'Gallery',
                style: robotoStyle(
                    size: 16, weight: FontWeight.w400, color: kwhiteColor),
              ),
              leading: const Icon(Icons.image, color: kwhiteColor),
              onTap: () async {
                Navigator.of(context).pop();
                await selectImage(ImageSource.gallery);
              },
            ),
            ListTile(
              title: Text(
                'Camera',
                style: robotoStyle(
                    size: 16, weight: FontWeight.w400, color: kwhiteColor),
              ),
              leading: const Icon(Icons.camera, color: kwhiteColor),
              onTap: () async {
                Navigator.of(context).pop();
                await selectImage(ImageSource.camera);
              },
            ),
          ],
        );
      },
    );
  }

  showReviewDialog(txt, btxt1, btxt2){
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
