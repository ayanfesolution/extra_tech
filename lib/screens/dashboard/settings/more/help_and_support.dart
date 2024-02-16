import 'package:auto_adjust/auto_adjust.dart';
import 'package:extra_tech/screens/dashboard/settings/settings_screen.dart';
import 'package:extra_tech/util/components/padded.dart';
import 'package:extra_tech/util/navigations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../util/constant.dart';

class HelpAndSupportScreen extends StatefulHookConsumerWidget {
  const HelpAndSupportScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _HelpAndSupportScreenState();
}

class _HelpAndSupportScreenState extends ConsumerState<HelpAndSupportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Help and Support',
          style: kCustomTextStyle(
            size: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Padded(
        child: Column(
          children: [
            Divider(),
            Gap(autoAdjustHeight(12)),
            Text(
              'Contact Extra tech support through any of the following channels.',
              style: kCustomTextStyle(
                fontWeight: FontWeight.w400,
                size: 12,
              ),
            ),
            Gap(autoAdjustHeight(27)),
            PackageContainer(
              child: Column(
                children: [
                  ListTile(
                    leading: SvgPicture.asset(
                      'assets/svgs/call-svgrepo-com1.svg',
                    ),
                    title: Text(
                      'Contacts Us',
                      style: kCustomTextStyle(
                        fontWeight: FontWeight.w300,
                        size: 12,
                      ),
                    ),
                    trailing:
                        SvgPicture.asset('assets/svgs/arrow-back-sim6.svg'),
                    onTap: () {},
                  ),
                  const Divider(),
                  ListTile(
                    leading: SvgPicture.asset(
                      'assets/svgs/email-icon2.svg',
                    ),
                    title: Text(
                      'Send us an email',
                      style: kCustomTextStyle(
                        fontWeight: FontWeight.w300,
                        size: 12,
                      ),
                    ),
                    trailing:
                        SvgPicture.asset('assets/svgs/arrow-back-sim6.svg'),
                    onTap: () {},
                  ),
                  const Divider(),
                  ListTile(
                    leading: SvgPicture.asset(
                      'assets/svgs/facebook-svgrepo-com1.svg',
                    ),
                    title: Text(
                      'Facebook',
                      style: kCustomTextStyle(
                        fontWeight: FontWeight.w300,
                        size: 12,
                      ),
                    ),
                    trailing:
                        SvgPicture.asset('assets/svgs/arrow-back-sim6.svg'),
                    onTap: () {},
                  ),
                  const Divider(),
                  ListTile(
                    leading: SvgPicture.asset(
                      'assets/svgs/instagram-svgrepo-com1.svg',
                    ),
                    title: Text(
                      'Instagram',
                      style: kCustomTextStyle(
                        fontWeight: FontWeight.w300,
                        size: 12,
                      ),
                    ),
                    trailing:
                        SvgPicture.asset('assets/svgs/arrow-back-sim6.svg'),
                    onTap: () {},
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
