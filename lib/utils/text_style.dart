import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle robotoStyle(
    {int? size,
    Color? color,
    FontWeight? weight,
    String? fontFamily,
    double? letterSpacing,
    FontStyle? fontStyle,
    double? wordSpacing,
    TextDecoration? decoration,
    TextDecorationStyle? textDecorationStyle,
    TextBaseline? textBaseline,
    Color? decorationColor,
    Color? backgroundColor,
    List<Shadow>? shadows,
    double? height,
    Paint? foreground}) {
  return GoogleFonts.roboto(
    fontSize: size != null ? size.toDouble() : 16,
    color: color,
    shadows: shadows,
    fontWeight: weight,
    letterSpacing: letterSpacing,
    fontStyle: fontStyle,
    decoration: decoration,
    decorationStyle: textDecorationStyle,
    decorationColor: decorationColor,
    wordSpacing: wordSpacing,
    textBaseline: textBaseline,
    backgroundColor: backgroundColor,
    height: height,
    foreground: foreground,
  );
}
