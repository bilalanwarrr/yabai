import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yabai/components/app_components.dart';
import 'package:yabai/components/textformfield.dart';
import 'package:yabai/utils/colors.dart';
import 'package:yabai/utils/sized_box.dart';
import 'package:yabai/utils/text_style.dart';
import 'package:yabai/views/auth/views/forgot_password_screen.dart';

import '../../../utils/assets_routes.dart';
import '../../../utils/const.dart';
import '../../dashboard/bottom_navigation/bottom_nav.dart';
import 'login_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  int screen = 0, methodScreen = 0;
  String phoneCode = '92';
  final Uri _url = Uri.parse('https://yabaisocial.com/');

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorOne,
      body: WillPopScope(
        onWillPop: () async {
          if (screen != 0) {
            setState(() {
              screen = screen - 1;
            });
          } else {
            Navigator.pop(context);
          }
          return false;
        },
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 25),
            height: height(context),
            child: Column(children: [
              80.sh,
              Image.asset(AssetsImagesRoutes.logoImage),
              Spacer(),
              screen == 0
                  ? Column(
                      children: [
                        Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Text(
                                'Let’s get you started!\n\n\nWhat’s your full name?',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.nunito(
                                    textStyle: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: kwhiteColor)))),
                        60.sh,
                        MyTextField(validator: (v) {}, hint: 'First'),
                        25.sh,
                        MyTextField(validator: (v) {}, hint: 'Last'),
                      ],
                    )
                  : screen == 1
                      ? Column(
                          children: [
                            Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: Text(
                                    'Let’s create your account!\nUse my:',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.nunito(
                                        textStyle: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: kwhiteColor)))),
                            30.sh,
                            TextButton(
                                onPressed: () {
                                  setState(() {
                                    screen = 2;
                                    methodScreen = 1;
                                  });
                                },
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20))),
                                    padding: MaterialStateProperty.all(
                                        EdgeInsets.symmetric(
                                            horizontal: 45, vertical: 10)),
                                    backgroundColor: MaterialStateProperty.all(
                                        primaryColor.withOpacity(0.09))),
                                child: Text(
                                  'Phone Number',
                                  style: GoogleFonts.nunito(
                                      textStyle: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: klightPinkColor)),
                                )),
                            10.sh,
                            Text('or',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.nunito(
                                    textStyle: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: kwhiteColor))),
                            10.sh,
                            TextButton(
                                onPressed: () {
                                  setState(() {
                                    screen = 2;
                                    methodScreen = 2;
                                  });
                                },
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20))),
                                    padding: MaterialStateProperty.all(
                                        EdgeInsets.symmetric(
                                            horizontal: 80, vertical: 10)),
                                    backgroundColor: MaterialStateProperty.all(
                                        primaryColor.withOpacity(0.09))),
                                child: Text('Email',
                                    style: GoogleFonts.nunito(
                                        textStyle: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: klightPinkColor)))),
                          ],
                        )
                      : screen == 2
                          ? Column(
                              children: [
                                methodScreen == 2 ? MyTextField(validator: (v) {}, hint: 'Email', textAlign: TextAlign.center,) :
                                Container(
                                  decoration: BoxDecoration(
                                    color: kwhiteColor,
                                    borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: Row(
                                    children: [
                                      CountryListPick(
                                          appBar: AppBar(
                                            backgroundColor: colorOne,
                                            title: Text('Select country'),
                                          ),
                                          pickerBuilder: (context, CountryCode? countryCode){
                                            return Row(
                                              children: [
                                                Image.asset(
                                                  countryCode!.flagUri!,
                                                  package: 'country_list_pick',
                                                  height: 35,
                                                  width: 45,
                                                ),
                                                10.sw,
                                                Text(countryCode.dialCode!, style: robotoStyle(
                                                  size: 12,
                                                  weight: FontWeight.w400,
                                                  color: klightGreyColor,
                                                ),),
                                                5.sw,
                                                Icon(Icons.arrow_drop_down_sharp, size: 20, color: klightGreyColor,)
                                              ],
                                            );
                                          },
                                          theme: CountryTheme(
                                            isShowFlag: true,
                                            isShowTitle: false,
                                            isShowCode: true,
                                            isDownIcon: false,
                                            showEnglishName: false,
                                          ),
                                          // Set default value
                                          initialSelection: phoneCode,
                                          onChanged: (CountryCode? code) {
                                            setState(() {
                                              phoneCode = code!.dialCode!;
                                            });
                                          },
                                          useUiOverlay: true,
                                          useSafeArea: false),
                                      Expanded(
                                        child: TextFormField(
                                          keyboardType: TextInputType.number, //TextInputType.visiblePassword,
                                          cursorColor: primaryColor,
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: 'Phone Number',
                                              hintStyle: robotoStyle(
                                                size: 12,
                                                weight: FontWeight.w400,
                                                color: kdarkGreyColor,

                                              )),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                10.sh,
                                GestureDetector(
                                  onTap: _launchUrl,
                                  child: RichText(
                                      textAlign: TextAlign.center,
                                      text: TextSpan(children: [
                                        TextSpan(
                                            text:
                                                'By tapping ’’Next’’, you agree to our ',
                                            style: GoogleFonts.nunito(
                                                textStyle: TextStyle(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w500,
                                                    color: kwhiteColor))),
                                        TextSpan(
                                            text: 'Terms of Service ',
                                            style: GoogleFonts.nunito(
                                                textStyle: TextStyle(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w500,
                                                    color: klightPinkColor))),
                                        TextSpan(
                                            text: 'and ',
                                            style: GoogleFonts.nunito(
                                                textStyle: TextStyle(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w500,
                                                    color: kwhiteColor))),
                                        TextSpan(
                                            text: 'Privacy Policy',
                                            style: GoogleFonts.nunito(
                                                textStyle: TextStyle(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w500,
                                                    color: klightPinkColor)))
                                      ])),
                                )
                              ],
                            )
                          : screen == 3
                              ? Column(
                                  children: [
                                    Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20.0),
                                        child: Text(
                                            'Your username\n\n\n@(use user fist and last name: firstlast)',
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.nunito(
                                                textStyle: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                    color: kwhiteColor)))),
                                    40.sh,
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => ChangeUserName()));
                                      },
                                      child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20.0),
                                          child: Text('Change your username',
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.nunito(
                                                  textStyle: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: kwhiteColor)))),
                                    )
                                  ],
                                )
                              : screen == 4 ? Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0),
                                  child: Text(
                                      'Find your friends.\n\nTap allow.',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.nunito(
                                          textStyle: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: kwhiteColor)))) : Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0),
                  child: Text(
                      'Find places and events near you.\n\nTap allow.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.nunito(
                          textStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: kwhiteColor)))),
              Spacer(),
              Spacer(),
              AppComponents().button(
                  text: 'Next',
                  onTap: () async {
                    if (screen != 5) {
                      setState(() {
                        screen = screen + 1;
                      });
                    } else {
                      if(await Permission.location.isGranted == true){
                        setState(() {
                          isLocation = true;
                        });
                      }
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyBottomNav()));
                    }

                    print(screen);
                    if(screen == 4){
                      print('contacts....');
                      // if(Permission.contacts.isD == false){
                        await Permission.contacts.request();
                      // }
                    }

                    if(screen == 5){
                      print('location....');
                      // if(Permission.location.isGranted == false){
                        await Permission.location.request();
                      // }
                    }
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
      ),
    );
  }
}

class ChangeUserName extends StatelessWidget {
  ChangeUserName({Key? key}) : super(key: key);

  final userNameTxt = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorOne,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 25),
          height: height(context),
          child: Column(children: [
            80.sh,
            Image.asset(AssetsImagesRoutes.logoImage),
            Spacer(),
            Column(
              children: [
                MyTextField(validator: (v) {}, hint: '@'),
              ],
            ),
            Spacer(),
            Spacer(),
            AppComponents().button(
                text: 'Next',
                onTap: () {
                  Navigator.pop(context);
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
