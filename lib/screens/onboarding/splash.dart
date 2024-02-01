import 'dart:async';

import 'package:auto_adjust/auto_adjust.dart';
import 'package:extra_tech/util/color.dart';
import 'package:extra_tech/util/navigations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'onboarding_screen.dart';

class SplashScreen extends StatefulHookWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static const String id = 'splash.screen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  @override
  void initState() {
    initialAction();
    super.initState();
  }

  Future<Timer> initialAction() async {
    return Timer(
      const Duration(seconds: 4),
      () {
        RouteNavigators.routeReplace(context, const OnboardingScreen());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final AnimationController controller = useAnimationController(
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    late final Animation<double> animation = CurvedAnimation(
      parent: controller,
      curve: Curves.easeOutBack,
    );
    SizeConfig().init(context, 812, 375);
    return Scaffold(
      backgroundColor: kPRYCOLOUR,
      body: Center(
        child: SizedBox(
          height: autoAdjustHeight(105),
          width: autoAdjustWidth(105),
          child: ScaleTransition(
            scale: animation,
            child: Image.asset(
              'assets/images/mainlogo.png',
              height: autoAdjustHeight(85),
              width: autoAdjustWidth(240),
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
