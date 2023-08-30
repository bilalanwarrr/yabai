import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:yabai/utils/colors.dart';
import 'package:yabai/utils/sized_box.dart';
import 'package:yabai/views/auth/views/reset_forgot_password_screen.dart';

import '../../../components/app_components.dart';
import '../../../components/textformfield.dart';
import '../../../utils/assets_routes.dart';
import '../../../utils/const.dart';
import '../../../utils/text_style.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

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
                  padding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
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
                              color: primaryColor, size: 20)))),
              40.sh,
              Image.asset(AssetsImagesRoutes.logoImage),
              const Spacer(),
              Container(
                  height: height(context) * 0.4,
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
                        OtpTextField(
                            numberOfFields: 5,
                            borderColor: primaryColor,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            cursorColor: primaryColor,
                            enabledBorderColor: primaryColor,
                            focusedBorderColor: primaryColor,
                            textStyle: robotoStyle(
                                size: 16,
                                weight: FontWeight.w400,
                                color: kwhiteColor),
                            showFieldAsBox: true,
                            onCodeChanged: (String code) {},
                            onSubmit: (String verificationCode) {}),
                        20.sh,
                        AppComponents().button(
                            text: 'Continue',
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ResetForgotPasswordScreen()));
                            }),
                      ]))
            ],
          ),
        ),
      ),
    );
  }
}
