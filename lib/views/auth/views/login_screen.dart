import 'package:flutter/material.dart';
import 'package:yabai/components/app_components.dart';
import 'package:yabai/components/textformfield.dart';
import 'package:yabai/utils/colors.dart';
import 'package:yabai/utils/sized_box.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../utils/assets_routes.dart';
import '../../../utils/const.dart';
import '../../dashboard/bottom_navigation/bottom_nav.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                    'Welcome back!\n\n\nEnter your email and password',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.nunito(textStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: kwhiteColor)))),

            60.sh,
            MyTextField(validator: (v) {}, hint: 'Email'),
            25.sh,
            MyTextField(validator: (v) {}, hint: 'Password'),
            Spacer(),
            Spacer(),
            AppComponents().button(
                text: 'Next',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyBottomNav()));
                }),
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
