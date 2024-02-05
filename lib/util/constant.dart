import 'package:auto_adjust/auto_adjust.dart';
import 'package:extra_tech/util/color.dart';
import 'package:flutter/material.dart';

TextStyle kCustomTextStyle({
  double size = 0,
  FontWeight fontWeight = FontWeight.w400,
  Color color = kTextColor,
}) =>
    TextStyle(
      fontSize: autoAdjustHeight(size),
      fontWeight: fontWeight,
      color: color,
      height: 0,
    );
