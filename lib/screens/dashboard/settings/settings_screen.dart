import 'package:auto_adjust/auto_adjust.dart';
import 'package:extra_tech/screens/dashboard/bottom_nav_bar.dart';
import 'package:extra_tech/util/components/padded.dart';
import 'package:extra_tech/util/constant.dart';
import 'package:extra_tech/util/navigations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'more/more_screen.dart';
import 'notification/notification.dart';
import 'password_management/password_management.dart';
import 'profile/profile_screen.dart';
import 'security/security_question.dart';

class SettingsScreen extends StatefulHookConsumerWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: kCustomTextStyle(
            size: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Padded(
        child: Column(
          children: [
            const Divider(),
            Gap(autoAdjustHeight(25)),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/svgs/user-edit-svgrepo-com 1.svg',
                      ),
                      Gap(autoAdjustWidth(20)),
                      Text(
                        'Profile',
                        style: kCustomTextStyle(
                          fontWeight: FontWeight.w700,
                          size: 14,
                        ),
                      )
                    ],
                  ),
                  Gap(autoAdjustHeight(11)),
                  GestureDetector(
                    onTap: () => RouteNavigators.route(
                      context,
                      const ProfileScreenPage(),
                    ),
                    child: PackageContainer(
                      child: Row(
                        children: [
                          CircleAvatar(
                            maxRadius: autoAdjustHeight(20),
                            child: Image.asset(
                              'assets/images/Group19.png',
                              fit: BoxFit.fill,
                            ),
                          ),
                          Gap(autoAdjustWidth(11)),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Raphael Mobbin',
                                  style: kCustomTextStyle(
                                    size: 12,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  'raphaelmobbin@gmail.com',
                                  style: kCustomTextStyle(
                                    size: 11,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xFF7D7D7D),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SvgPicture.asset('assets/svgs/arrow-back-sim6.svg')
                        ],
                      ),
                    
                    ),
                  ),
                  Gap(autoAdjustHeight(11)),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/svgs/user-edit-svgrepo-com 1.svg',
                      ),
                      Gap(autoAdjustWidth(20)),
                      Text(
                        'Preferences',
                        style: kCustomTextStyle(
                          fontWeight: FontWeight.w700,
                          size: 14,
                        ),
                      )
                    ],
                  ),
                  Gap(autoAdjustHeight(11)),
                  PackageContainer(
                    child: Column(
                      children: [
                        ListTile(
                          leading: SvgPicture.asset(
                              'assets/svgs/setting-bell-notification-.svg'),
                          title: Text(
                            'Notifications',
                            style: kCustomTextStyle(
                              fontWeight: FontWeight.w300,
                              size: 12,
                            ),
                          ),
                          trailing: SvgPicture.asset(
                              'assets/svgs/arrow-back-sim6.svg'),
                          onTap: () {
                            RouteNavigators.route(
                              context,
                              const NotificationScreen(),
                            );
                          },
                        ),
                        const Divider(),
                        ListTile(
                          leading: SvgPicture.asset(
                              'assets/svgs/favorite-chart-svgrep.svg'),
                          title: Text(
                            'Favorites',
                            style: kCustomTextStyle(
                              fontWeight: FontWeight.w300,
                              size: 12,
                            ),
                          ),
                          trailing: SvgPicture.asset(
                            'assets/svgs/arrow-back-sim6.svg',
                          ),
                          onTap: () {
                            RouteNavigators.route(
                              context,
                              const BottomNavBar(
                                currentIndex: 2,
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                  Gap(autoAdjustHeight(11)),
                  Row(
                    children: [
                      SvgPicture.asset('assets/svgs/private-lock-icon4.svg'),
                      Gap(autoAdjustWidth(20)),
                      Text(
                        'Security',
                        style: kCustomTextStyle(
                          fontWeight: FontWeight.w700,
                          size: 14,
                        ),
                      )
                    ],
                  ),
                  Gap(autoAdjustHeight(11)),
                  PackageContainer(
                    child: Column(
                      children: [
                        ListTile(
                          leading: SvgPicture.asset(
                            'assets/svgs/Change_password.svg',
                          ),
                          title: Text(
                            'Password Management',
                            style: kCustomTextStyle(
                              fontWeight: FontWeight.w300,
                              size: 12,
                            ),
                          ),
                          trailing: SvgPicture.asset(
                              'assets/svgs/arrow-back-sim6.svg'),
                          onTap: () {
                            RouteNavigators.route(
                              context,
                              const PasswordManagementScreen(),
                            );
                          },
                        ),
                        const Divider(),
                        ListTile(
                          leading: SvgPicture.asset(
                            'assets/svgs/security_question.svg',
                          ),
                          title: Text(
                            'Security Question',
                            style: kCustomTextStyle(
                              fontWeight: FontWeight.w300,
                              size: 12,
                            ),
                          ),
                          trailing: SvgPicture.asset(
                            'assets/svgs/arrow-back-sim6.svg',
                          ),
                          onTap: () {
                            RouteNavigators.route(
                              context,
                              const SecurityQuestionScreen(),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                  Gap(autoAdjustHeight(18)),
                  GestureDetector(
                    onTap: () {
                      RouteNavigators.route(
                        context,
                        const MoreScreen(),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset(
                            'assets/svgs/more-horizontal-circle-svgrepo-com2.svg'),
                        Gap(autoAdjustWidth(20)),
                        Expanded(
                          child: Text(
                            'More',
                            style: kCustomTextStyle(
                              fontWeight: FontWeight.w700,
                              size: 14,
                            ),
                          ),
                        ),
                        SvgPicture.asset('assets/svgs/arrow-back-sim6.svg'),
                      ],
                    ),
                  ),
                  Gap(autoAdjustHeight(18)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PackageContainer extends StatelessWidget {
  const PackageContainer({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFC7C7C7).withOpacity(0.37),
            blurStyle: BlurStyle.normal,
            spreadRadius: 0,
            blurRadius: autoAdjustHeight(2),
          )
        ],
        borderRadius: BorderRadius.circular(
          autoAdjustHeight(10),
        ),
        color: Colors.white,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: autoAdjustWidth(22),
        vertical: autoAdjustHeight(10),
      ),
      child: child,
    );
  }
}
