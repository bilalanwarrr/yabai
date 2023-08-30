import 'package:flutter/material.dart';
import 'package:yabai/utils/assets_routes.dart';
import 'package:yabai/utils/colors.dart';
import 'package:yabai/utils/const.dart';
import 'package:yabai/utils/sized_box.dart';
import 'package:yabai/views/auth/views/login_screen.dart';

import '../../../components/app_components.dart';
import '../../../components/textformfield.dart';
import '../../../utils/text_style.dart';

class ResetForgotPasswordScreen extends StatelessWidget {
  const ResetForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kbackgroundColor,
        body: SingleChildScrollView(
            child: SizedBox(
                height: height(context),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 30, horizontal: 20),
                          child: InkWell(
                              onTap: () => Navigator.pop(context),
                              child: Container(
                                  height: 40,
                                  width: 40,
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10),
                                  padding: const EdgeInsets.all(5),
                                  decoration: const BoxDecoration(
                                      color: kdarkGreyColor,
                                      shape: BoxShape.circle),
                                  child: const Icon(Icons.arrow_back_rounded,
                                      color: primaryColor, size: 20)))),
                      40.sh,
                      Image.asset(AssetsImagesRoutes.logoImage),
                      const Spacer(),
                      Container(
                          height: height(context) * 0.5,
                          padding: const EdgeInsets.all(20),
                          width: width(context),
                          decoration: const BoxDecoration(
                              color: knavyBlueColor,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30))),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(children: [
                                  Text('Reset Password',
                                      style: robotoStyle(
                                          size: 20,
                                          color: kwhiteColor,
                                          weight: FontWeight.w500))
                                ]),
                                30.sh,
                                MyTextField(
                                    validator: (v) {}, hint: 'New Password'),
                                20.sh,
                                MyTextField(
                                    validator: (v) {},
                                    hint: 'Confirm New Password'),
                                20.sh,
                                AppComponents().button(
                                    text: 'Reset',
                                    onTap: () {
                                      Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  LoginScreen()),
                                          (route) => false);
                                    })
                              ]))
                    ]))));
  }
}
