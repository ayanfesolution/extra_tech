import 'package:auto_adjust/auto_adjust.dart';
import 'package:extra_tech/screens/dashboard/settings/settings_screen.dart';
import 'package:extra_tech/util/color.dart';
import 'package:extra_tech/util/components/padded.dart';
import 'package:extra_tech/util/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../products/product_details.dart';

class VendorScreen extends StatefulHookConsumerWidget {
  const VendorScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _VendorScreenState();
}

class _VendorScreenState extends ConsumerState<VendorScreen> {
  @override
  Widget build(BuildContext context) {
    var currentSelection = useState(0);
    return Scaffold(
      appBar: AppBar(),
      body: Padded(
        child: Column(
          children: [
            Gap(
              autoAdjustHeight(30),
            ),
            SizedBox(
              height: autoAdjustHeight(80),
              width: autoAdjustWidth(90),
              child: Image.asset(
                'assets/images/Rectangle43.png',
                fit: BoxFit.fill,
              ),
            ),
            Gap(
              autoAdjustHeight(28),
            ),
            Text(
              'QUARTZ 5000',
              style: kCustomTextStyle(
                size: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            Gap(
              autoAdjustHeight(15),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: autoAdjustHeight(30),
                  width: autoAdjustWidth(80),
                  decoration: BoxDecoration(
                    color: kSECCOLOUR,
                    borderRadius: BorderRadius.circular(
                      autoAdjustHeight(3),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Turn on',
                        style: kCustomTextStyle(
                          fontWeight: FontWeight.w500,
                          size: 12,
                          color: kWHTCOLOUR,
                        ),
                      ),
                      Gap(
                        autoAdjustWidth(6),
                      ),
                      Icon(
                        Icons.notifications,
                        color: kWHTCOLOUR,
                        size: autoAdjustHeight(12),
                      )
                    ],
                  ),
                ),
                Gap(
                  autoAdjustWidth(10),
                ),
                Container(
                  height: autoAdjustHeight(30),
                  width: autoAdjustWidth(80),
                  decoration: BoxDecoration(
                    color: Color(0xFFD9D9E3),
                    borderRadius: BorderRadius.circular(
                      autoAdjustHeight(3),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Chat',
                        style: kCustomTextStyle(
                          fontWeight: FontWeight.w500,
                          size: 12,
                          color: kSECCOLOUR,
                        ),
                      ),
                      Gap(
                        autoAdjustWidth(6),
                      ),
                      Icon(
                        Icons.message,
                        color: kSECCOLOUR,
                        size: autoAdjustHeight(12),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Gap(
              autoAdjustHeight(28),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    currentSelection.value = 0;
                  },
                  child: ActionList(
                    title: 'Products',
                    isItTheCurrent: currentSelection.value == 0,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    currentSelection.value = 1;
                  },
                  child: ActionList(
                    title: 'Popular',
                    isItTheCurrent: currentSelection.value == 1,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    currentSelection.value = 2;
                  },
                  child: ActionList(
                    title: 'Newest',
                    isItTheCurrent: currentSelection.value == 2,
                  ),
                )
              ],
            ),
            Gap(
              autoAdjustHeight(40),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15.0,
                  mainAxisExtent: autoAdjustHeight(223),
                ),
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: autoAdjustWidth(5),
                      vertical: autoAdjustHeight(6),
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xFFD9D9E3),
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: autoAdjustHeight(130),
                          width: autoAdjustWidth(130),
                          child: Image.asset('assets/images/images(34)1.png'),
                        ),
                        Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                autoAdjustHeight(10),
                              ),
                              color: const Color(0xFFD9D9E3),
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: autoAdjustWidth(13),
                              vertical: autoAdjustHeight(10),
                            ),
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'QUARTZ 5000',
                                      style: kCustomTextStyle(
                                        size: 14,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Text(
                                      'TotalEnergies',
                                      style: kCustomTextStyle(
                                        size: 10,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                    Gap(autoAdjustHeight(12)),
                                    Text(
                                      '520.99',
                                      style: kCustomTextStyle(
                                        size: 14,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ))
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
