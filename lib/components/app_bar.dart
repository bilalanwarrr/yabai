import 'package:flutter/material.dart';
import 'package:yabai/utils/text_style.dart';

import '../utils/colors.dart';

class MyAppBar extends StatelessWidget {
  String? title;
  bool showBackIcon;
  List<Widget> actions = [];
  MyAppBar(
      {super.key,
      required this.title,
      this.showBackIcon = true,
      this.actions = const []});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: knavyBlueColor,
      appBar: AppBar(
          backgroundColor: knavyBlueColor,
          elevation: 0,
          centerTitle: false,
          leading: showBackIcon
              ? Transform.translate(
                  offset: const Offset(0, 0),
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
                      )),
                )
              : const SizedBox(),
          title: Transform.translate(
            offset: const Offset(0, 0),
            child: Text(
              title!,
              style: robotoStyle(
                  size: 18, weight: FontWeight.w600, color: kwhiteColor),
            ),
          ),
          actions: actions),
    );
  }
}
