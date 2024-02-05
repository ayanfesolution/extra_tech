import 'package:auto_adjust/auto_adjust.dart';
import 'package:extra_tech/screens/dashboard/bottom_nav_bar.dart';
import 'package:extra_tech/util/components/main_button.dart';
import 'package:extra_tech/util/constant.dart';
import 'package:extra_tech/util/navigations.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RegistrationCompletedScreen extends StatefulHookConsumerWidget {
  const RegistrationCompletedScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _RegistrationCompletedScreenState();
}

class _RegistrationCompletedScreenState
    extends ConsumerState<RegistrationCompletedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: autoAdjustHeight(450),
            width: double.maxFinite,
            child: Stack(
              children: [
                SizedBox(
                  height: autoAdjustHeight(404),
                  width: double.maxFinite,
                  child: Image.asset(
                    'assets/images/Rectangle8.png',
                    fit: BoxFit.fill,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    height: autoAdjustHeight(90),
                    width: autoAdjustWidth(90),
                    child: Image.asset(
                      'assets/images/mainlogo.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: autoAdjustWidth(16)),
            child: Column(
              children: [
                Text(
                  'Welcome on board',
                  style: kCustomTextStyle(
                    size: 32,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Gap(autoAdjustHeight(12)),
                Text(
                  'A platform built for a new way of working',
                  style: kCustomTextStyle(
                    size: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Gap(autoAdjustHeight(75)),
                ExtraTechMainButton(
                  text: 'Go To Dashboard',
                  onTap: () {
                    RouteNavigators.routeNoWayHome(
                      context,
                      const BottomNavBar(),
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
