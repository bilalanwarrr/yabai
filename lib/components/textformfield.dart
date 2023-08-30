// ignore_for_file: unnecessary_null_in_if_null_operators, must_be_immutable

import 'package:flutter/material.dart';
import 'package:yabai/utils/colors.dart';

import '../utils/text_style.dart';

class MyTextField extends StatefulWidget {
  String? hint;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final String? Function(String?)? validator;
  final ValueChanged<String?>? onChanged;
  bool? obsecureText;
  bool? enabled;
  final String? initialValue;
  final bool filled;
  final Color? fillColor;
  Widget? suffix;
  Widget? prefixIcon;
  int maxLine;
  int minLines;
  Color? hintColor;
  TextAlign? textAlign;

  Color? enabledBorderColor;
  double borderRadius;
  MyTextField(
      {Key? key,
      this.hint = 'Type here',
      this.controller,
      this.textInputType = TextInputType.text,
      required this.validator,
      this.onChanged,
      this.obsecureText = false,
      this.filled = true,
      this.enabled = true,
      this.fillColor,
      this.initialValue,
      this.suffix,
      this.prefixIcon,
      this.maxLine = 1,
      this.minLines = 1,
      this.enabledBorderColor,
      this.hintColor = kdarkGreyColor,
      this.borderRadius = 10, this.textAlign = TextAlign.start})
      : super(key: key);

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextFormField(
        textAlign: widget.textAlign!,
        controller: widget.controller,
        obscureText: widget.obsecureText!,
        keyboardType: widget.textInputType, //TextInputType.visiblePassword,
        validator: widget.validator,
        enabled: widget.enabled!,
        maxLines: widget.maxLine,
        onChanged: widget.onChanged,
        initialValue: widget.initialValue ?? widget.initialValue,
        cursorColor: primaryColor,
        decoration: InputDecoration(
            filled: widget.filled,
            fillColor:
            widget.fillColor ?? kwhiteColor, //kgreyColor.withOpacity(0.1),
            enabledBorder: OutlineInputBorder(
              borderSide:
              BorderSide(color: widget.enabledBorderColor ?? kwhiteColor),
              borderRadius: BorderRadius.circular(widget.borderRadius),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: primaryColor),
              borderRadius: BorderRadius.circular(widget.borderRadius),
            ),
            hintText: widget.hint!,
            hintStyle: robotoStyle(
              size: 12,
              weight: FontWeight.w400,
              color: widget.hintColor,

            ),
            prefixIcon: widget.prefixIcon ?? null,
            suffixIcon: widget.suffix ?? null),
      ),
    );
  }
}
