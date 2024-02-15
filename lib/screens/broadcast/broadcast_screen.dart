import 'package:auto_adjust/auto_adjust.dart';
import 'package:extra_tech/util/components/padded.dart';
import 'package:extra_tech/util/constant.dart';
import 'package:extra_tech/util/navigations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BroadcastFullScreen extends StatefulHookConsumerWidget {
  const BroadcastFullScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _BroadcastFullScreenState();
}

class _BroadcastFullScreenState extends ConsumerState<BroadcastFullScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(autoAdjustHeight(50)),
            GestureDetector(
                onTap: () => RouteNavigators.pop(context),
                child: SvgPicture.asset('assets/svgs/backUnique.svg')),
            Gap(autoAdjustHeight(10)),
            const Divider(),
            Gap(autoAdjustHeight(10)),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        child: Image.asset(
                          'assets/images/totalenergies1.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                      Gap(autoAdjustWidth(7)),
                      Text(
                        'Total Energies',
                        style: kCustomTextStyle(
                          size: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Gap(autoAdjustHeight(15)),
                  Text(
                    'It is the life that we choose, for every turn it takes for we shall overcome. ',
                    style: kCustomTextStyle(
                      size: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Gap(autoAdjustHeight(24)),
                  Padded(
                    child: SizedBox(
                      height: autoAdjustHeight(274),
                      width: double.maxFinite,
                      child: Stack(
                        children: [
                          GestureDetector(
                            onTap: () {
                              RouteNavigators.route(
                                context,
                                const BroadcastFullScreen(),
                              );
                            },
                            child: Image.asset(
                              'assets/images/postUpdate.png',
                              fit: BoxFit.fill,
                            ),
                          ),
                          Center(
                            child: GestureDetector(
                              child: SvgPicture.asset(
                                  'assets/svgs/play-svgrepo-com3.svg'),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Padding(
                              padding: EdgeInsets.all(autoAdjustHeight(8)),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SvgPicture.asset(
                                    'assets/svgs/chat-svgrepo-com2.svg',
                                  ),
                                  Text(
                                    '2.3k',
                                    style: kCustomTextStyle(
                                        size: 10,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white),
                                  ),
                                  Gap(autoAdjustHeight(20)),
                                  SvgPicture.asset(
                                    'assets/svgs/like_icon.svg',
                                  ),
                                  Text(
                                    '15.9k',
                                    style: kCustomTextStyle(
                                        size: 10,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Gap(autoAdjustHeight(32)),
                  const Divider(),
                  Container(
                    height: autoAdjustHeight(96),
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        autoAdjustHeight(10),
                      ),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 0,
                          blurRadius: 12,
                          color: const Color(0xFFC7C7C7).withOpacity(0.37),
                        )
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(autoAdjustHeight(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'TotalEnergies Marketing Nigeria PLC',
                                  style: kCustomTextStyle(
                                    size: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Gap(autoAdjustHeight(10)),
                                Text(
                                  '000 0000 0000 000',
                                  style: kCustomTextStyle(
                                    size: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              SvgPicture.asset(
                                'assets/svgs/gas-station-location-icon1.svg',
                              ),
                              Gap(autoAdjustHeight(10)),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: autoAdjustWidth(10),
                                  vertical: autoAdjustHeight(5),
                                ),
                                decoration: BoxDecoration(
                                  color:
                                      const Color(0xFF050247).withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(
                                    autoAdjustHeight(30),
                                  ),
                                ),
                                child: Text(
                                  'Enugu, Nigeria',
                                  style: kCustomTextStyle(
                                    size: 10,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Gap(autoAdjustHeight(39)),
                  SizedBox(
                    height: autoAdjustHeight(40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Join the customer’s List',
                          style: kCustomTextStyle(
                            size: 13,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Switch(
                          value: true,
                          onChanged: (value) {},
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
