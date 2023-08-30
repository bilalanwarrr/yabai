import 'package:flutter/material.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/text_style.dart';

class ProfileScreenComponents {
  Widget item({required String text}) {
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            border: Border.all(color: primaryColor)),
        child: Text(text,
            style: robotoStyle(
                color: primaryColor, size: 16, weight: FontWeight.w500)));
  }
}
