import 'package:extra_tech/screens/dashboard/settings/more/help_and_support.dart';
import 'package:extra_tech/screens/dashboard/settings/settings_screen.dart';
import 'package:extra_tech/util/navigations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../util/constant.dart';

class MoreScreen extends StatefulHookConsumerWidget {
  const MoreScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MoreScreenState();
}

class _MoreScreenState extends ConsumerState<MoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'More',
          style: kCustomTextStyle(
            size: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Column(
        children: [
          PackageContainer(
            child: Column(
              children: [
                ListTile(
                  leading: SvgPicture.asset(
                    'assets/svgs/Change_password.svg',
                  ),
                  title: Text(
                    'Help and Support',
                    style: kCustomTextStyle(
                      fontWeight: FontWeight.w300,
                      size: 12,
                    ),
                  ),
                  trailing: SvgPicture.asset('assets/svgs/arrow-back-sim6.svg'),
                  onTap: () {
                    RouteNavigators.route(
                      context,
                      const HelpAndSupportScreen(),
                    );
                  },
                ),
                Divider(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
