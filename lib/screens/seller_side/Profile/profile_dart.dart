import 'package:auto_adjust/auto_adjust.dart';
import 'package:extra_tech/screens/dashboard/bottom_nav_bar.dart';
import 'package:extra_tech/screens/dashboard/settings/more/more_screen.dart';
import 'package:extra_tech/screens/dashboard/settings/notification/notification.dart';
import 'package:extra_tech/screens/dashboard/settings/password_management/password_management.dart';
import 'package:extra_tech/screens/dashboard/settings/profile/profile_screen.dart';
import 'package:extra_tech/screens/dashboard/settings/security/security_question.dart';
import 'package:extra_tech/screens/seller_side/Profile/working_hours.dart';
import 'package:extra_tech/util/color.dart';
import 'package:extra_tech/util/components/padded.dart';
import 'package:extra_tech/util/constant.dart';
import 'package:extra_tech/util/navigations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProfileSellerScreen extends StatefulHookConsumerWidget {
  const ProfileSellerScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ProfileSellerScreenState();
}

class _ProfileSellerScreenState extends ConsumerState<ProfileSellerScreen> {
  @override
  Widget build(BuildContext context) {
    var srrValue = useState(false);
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
                  // Gap(autoAdjustHeight(11)),
                  // Row(
                  //   children: [
                  //     SvgPicture.asset(
                  //       'assets/svgs/user-edit-svgrepo-com 1.svg',
                  //     ),
                  //     Gap(autoAdjustWidth(20)),
                  //     Text(
                  //       'Preferences',
                  //       style: kCustomTextStyle(
                  //         fontWeight: FontWeight.w700,
                  //         size: 14,
                  //       ),
                  //     )
                  //   ],
                  // ),
                  // Gap(autoAdjustHeight(11)),
                  // PackageContainer(
                  //   child: Column(
                  //     children: [
                  //       ListTile(
                  //         leading: SvgPicture.asset(
                  //             'assets/svgs/setting-bell-notification-.svg'),
                  //         title: Text(
                  //           'Notifications',
                  //           style: kCustomTextStyle(
                  //             fontWeight: FontWeight.w300,
                  //             size: 12,
                  //           ),
                  //         ),
                  //         trailing: SvgPicture.asset(
                  //             'assets/svgs/arrow-back-sim6.svg'),
                  //         onTap: () {
                  //           RouteNavigators.route(
                  //             context,
                  //             const NotificationScreen(),
                  //           );
                  //         },
                  //       ),
                  //       const Divider(),
                  //       ListTile(
                  //         leading: SvgPicture.asset(
                  //             'assets/svgs/favorite-chart-svgrep.svg'),
                  //         title: Text(
                  //           'Favorites',
                  //           style: kCustomTextStyle(
                  //             fontWeight: FontWeight.w300,
                  //             size: 12,
                  //           ),
                  //         ),
                  //         trailing: SvgPicture.asset(
                  //           'assets/svgs/arrow-back-sim6.svg',
                  //         ),
                  //         onTap: () {
                  //           RouteNavigators.route(
                  //             context,
                  //             const BottomNavBar(
                  //               currentIndex: 2,
                  //             ),
                  //           );
                  //         },
                  //       )
                  //     ],
                  //   ),
                  // ),

                  Gap(autoAdjustHeight(11)),
                  Row(
                    children: [
                      SvgPicture.asset('assets/svgs/status-svgrepo-com1.svg'),
                      Gap(autoAdjustWidth(20)),
                      Text(
                        'Status',
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
                            'assets/svgs/booking-reservation-icon.svg',
                          ),
                          title: Text(
                            'Confirm Status',
                            style: kCustomTextStyle(
                              fontWeight: FontWeight.w300,
                              size: 12,
                            ),
                          ),
                          trailing: SvgPicture.asset(
                              'assets/svgs/arrow-back-sim6.svg'),
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return Dialog(
                                  backgroundColor: Colors.white,
                                  shape: ContinuousRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                      autoAdjustHeight(25),
                                    ),
                                  ),
                                  child: const SetStatusWidget(),
                                );
                              },
                            );
                          },
                        ),
                        const Divider(),
                        ListTile(
                          leading: SvgPicture.asset(
                            'assets/svgs/target-audience-icon.svg',
                          ),
                          title: Text(
                            'Choose Audience',
                            style: kCustomTextStyle(
                              fontWeight: FontWeight.w300,
                              size: 12,
                            ),
                          ),
                          trailing: SvgPicture.asset(
                            'assets/svgs/arrow-back-sim6.svg',
                          ),
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return Dialog(
                                  backgroundColor: Colors.white,
                                  shape: ContinuousRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                      autoAdjustHeight(25),
                                    ),
                                  ),
                                  child: const ChoseAudienceWidget(),
                                );
                              },
                            );
                          },
                        ),
                        const Divider(),
                        ListTile(
                          leading: SvgPicture.asset(
                            'assets/svgs/business-working-hours-icon.svg',
                          ),
                          title: Text(
                            'Work Hours',
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
                              const WorkingHoursScreen(),
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
                        SvgPicture.asset('assets/svgs/Group126.svg'),
                        Gap(autoAdjustWidth(20)),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'SRR',
                                style: kCustomTextStyle(
                                  fontWeight: FontWeight.w700,
                                  size: 14,
                                ),
                              ),
                              Text(
                                'Send Order Request',
                                style: kCustomTextStyle(
                                  fontWeight: FontWeight.w300,
                                  size: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Switch(
                          value: srrValue.value,
                          onChanged: (value) {
                            srrValue.value = value;
                          },
                        )
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

class SetStatusWidget extends StatefulHookWidget {
  const SetStatusWidget({super.key});

  @override
  State<SetStatusWidget> createState() => _SetStatusWidgetState();
}

class _SetStatusWidgetState extends State<SetStatusWidget> {
  @override
  Widget build(BuildContext context) {
    var currentAudience = useState('active');
    return SizedBox(
      height: autoAdjustHeight(190),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: autoAdjustWidth(15),
          vertical: autoAdjustHeight(23),
        ),
        child: Column(
          children: [
            Text(
              'Confirm Status',
              style: kCustomTextStyle(
                size: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
            ListTile(
              leading: currentAudience.value == 'active'
                  ? const Icon(
                      Icons.check_circle,
                      color: kPRYCOLOUR,
                    )
                  : const Icon(
                      Icons.check_circle,
                      color: kINACTIVECOLOR,
                    ),
              title: Text(
                'Active',
                style: kCustomTextStyle(
                  fontWeight: FontWeight.w400,
                  size: 11,
                ),
              ),
              onTap: () {
                currentAudience.value = 'active';
              },
            ),
            ListTile(
              leading: currentAudience.value == 'inactive'
                  ? const Icon(
                      Icons.check_circle,
                      color: kPRYCOLOUR,
                    )
                  : const Icon(
                      Icons.check_circle,
                      color: kINACTIVECOLOR,
                    ),
              title: Text(
                'Inactive',
                style: kCustomTextStyle(
                  fontWeight: FontWeight.w400,
                  size: 11,
                ),
              ),
              onTap: () {
                currentAudience.value = 'inactive';
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ChoseAudienceWidget extends StatefulHookWidget {
  const ChoseAudienceWidget({
    super.key,
  });

  @override
  State<ChoseAudienceWidget> createState() => _ChoseAudienceWidgetState();
}

class _ChoseAudienceWidgetState extends State<ChoseAudienceWidget> {
  @override
  Widget build(BuildContext context) {
    var currentAudience = useState('public');
    return SizedBox(
      height: autoAdjustHeight(190),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: autoAdjustWidth(15),
          vertical: autoAdjustHeight(23),
        ),
        child: Column(
          children: [
            Text(
              'Choose Audience',
              style: kCustomTextStyle(
                size: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
            ListTile(
              leading: currentAudience.value == 'public'
                  ? const Icon(
                      Icons.check_circle,
                      color: kPRYCOLOUR,
                    )
                  : const Icon(
                      Icons.check_circle,
                      color: kINACTIVECOLOR,
                    ),
              title: Text(
                'Public',
                style: kCustomTextStyle(
                  fontWeight: FontWeight.w400,
                  size: 11,
                ),
              ),
              onTap: () {
                currentAudience.value = 'public';
              },
            ),
            ListTile(
              leading: currentAudience.value == 'cac'
                  ? const Icon(
                      Icons.check_circle,
                      color: kPRYCOLOUR,
                    )
                  : const Icon(
                      Icons.check_circle,
                      color: kINACTIVECOLOR,
                    ),
              title: Text(
                'Customers with CAC only',
                style: kCustomTextStyle(
                  fontWeight: FontWeight.w400,
                  size: 11,
                ),
              ),
              onTap: () {
                currentAudience.value = 'cac';
              },
            ),
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
