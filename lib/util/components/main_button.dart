import 'package:auto_adjust/auto_adjust.dart';
import 'package:extra_tech/util/color.dart';
import 'package:flutter/material.dart';

class ExtraTechMainButton extends StatelessWidget {
  const ExtraTechMainButton({
    super.key,
    this.backgroundColor = kSECCOLOUR,
    this.cornerRadius = 1,
    this.child,
    required this.text,
    this.textColor = kWHTCOLOUR,
    this.useCustom = false,
    required this.onTap,
  });
  final bool useCustom;
  final String text;
  final Color textColor;
  final Color backgroundColor;
  final double cornerRadius;
  final Widget? child;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      onTap: onTap,
      child: Container(
        height: autoAdjustHeight(51),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(
            autoAdjustHeight(cornerRadius),
          ),
        ),
        child: Center(
          child: useCustom
              ? child
              : Text(
                  text,
                  style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.w800,
                  ),
                ),
        ),
      ),
    );
  }
}
