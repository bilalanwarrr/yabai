import 'dart:convert';
import 'dart:io';
import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yabai/utils/sized_box.dart';
import 'package:yabai/views/auth/views/login_screen.dart';
import 'package:yabai/views/auth/views/signup_screen.dart';

import '../../../components/app_components.dart';
import '../../../components/textformfield.dart';
import '../../../utils/assets_routes.dart';
import '../../../utils/colors.dart';
import '../../../utils/const.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {

  @override
  void initState() {
    super.initState();
    // FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorOne,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 25),
          height: height(context),
          child: Column(children: [
            Spacer(),
            Image.asset(AssetsImagesRoutes.logoImage),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                    'Make plans to meet with your friend.\nFast, easy, simple.\n\n\nGo out. Have fun. Repeat.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.nunito(textStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: kwhiteColor)))),

            60.sh,
            Spacer(),
            Spacer(),
            Column(
              children: [
                AppComponents().button(
                    text: 'Sign Up',
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignupScreen()));
                    }),
                30.sh,
                AppComponents().button(
                    text: 'Log in',
                    textColor: kblackColor,
                    borderColor: Colors.transparent,
                    color: kwhiteColor,
                    onTap: () async {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                    }),
              ],
            ),
            60.sh,
            // 10.sh,
            // GestureDetector(
            //   onTap: () {
            //     Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //             builder: (context) =>
            //                 ForgotPasswordScreen()));
            //   },
            //   child: Text('Forgot Password',
            //       style: robotoStyle(
            //           size: 14,
            //           color: kwhiteColor,
            //           weight: FontWeight.w400)),
            // ),
            // 30.sh,
            // AppComponents().richText(
            //     greyText: 'Don\'t have an account?',
            //     primaryText: 'Sign Up',
            //     onTap: () {
            //       Navigator.pushReplacement(
            //           context,
            //           MaterialPageRoute(
            //               builder: (context) => SignupScreen()));
            //     })
          ]),
        ),
      ),
    );
  }
}
