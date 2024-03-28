import 'dart:math';

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



String getRandomString(List<String> strings) {
  if (strings.isEmpty) {
    throw ArgumentError('The list of strings cannot be empty');
  }
  
  final random = Random();
  final randomIndex = random.nextInt(strings.length);
  
  return strings[randomIndex];
}