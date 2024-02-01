import 'package:auto_adjust/auto_adjust.dart';
import 'package:extra_tech/util/color.dart';
import 'package:extra_tech/util/components/padded.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPRYCOLOUR,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: autoAdjustHeight(392),
            width: double.maxFinite,
            child: Image.asset('assets/images/onboarding1.png'),
          ),
          Expanded(
            child: Padded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(
                    autoAdjustHeight(20),
                  ),
                  SizedBox(
                    height: autoAdjustHeight(37),
                    width: autoAdjustWidth(140),
                    child: Image.asset('assets/images/extratechLogo.png'),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
