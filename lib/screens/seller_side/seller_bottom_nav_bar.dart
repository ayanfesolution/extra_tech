import 'package:auto_adjust/auto_adjust.dart';
import 'package:extra_tech/screens/seller_side/dashboard/sellers_dashboard.dart';
import 'package:extra_tech/util/color.dart';
import 'package:extra_tech/util/constant.dart';
import 'package:extra_tech/util/navigations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'Profile/profile_dart.dart';
import 'product/upload_product.dart';

class SellerBottomNavBar extends StatefulHookConsumerWidget {
  const SellerBottomNavBar({
    super.key,
    this.currentIndex = 0,
  });
  final int currentIndex;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SellerBottomNavBarState();
}

class _SellerBottomNavBarState extends ConsumerState<SellerBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    var currentIndex = useState(widget.currentIndex);
    List<Widget> pages = [
      const SellerDashboard(),
      const ProfileSellerScreen(),
    ];

    return Scaffold(
      body: pages[currentIndex.value],
      bottomNavigationBar: SizedBox(
        height: autoAdjustHeight(72),
        width: double.maxFinite,
        child: Container(
          decoration: BoxDecoration(
            color: kWHTCOLOUR,
            boxShadow: [
              BoxShadow(
                spreadRadius: autoAdjustHeight(0.02),
              )
            ],
          ),
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: autoAdjustWidth(35),
                  vertical: autoAdjustHeight(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    NavBarButton(
                      imagePath: 'assets/svgs/home_icon.svg',
                      isItActive: currentIndex.value == 0,
                      onTap: () {
                        currentIndex.value = 0;
                      },
                      title: 'Dashboard',
                    ),
                    NavBarButton(
                      imagePath: 'assets/svgs/setting-2-svgrepo-com 7.svg',
                      isItActive: currentIndex.value == 1,
                      onTap: () {
                        currentIndex.value = 1;
                      },
                      title: 'Profile',
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: InkWell(
                  onTap: () {
                    RouteNavigators.route(
                      context,
                      const UploadProductScreen(),
                    );
                  },
                  child: SvgPicture.asset('assets/svgs/sellerplyus.svg'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NavBarButton extends StatelessWidget {
  const NavBarButton({
    super.key,
    required this.imagePath,
    required this.isItActive,
    required this.onTap,
    required this.title,
  });
  final String imagePath, title;
  final bool isItActive;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        //height: autoAdjustHeight(36),
        //width: autoAdjustWidth(56),
        padding: EdgeInsets.symmetric(
          horizontal: autoAdjustWidth(10),
          vertical: autoAdjustHeight(5),
        ),
        color: isItActive ? kPRYCOLOUR.withOpacity(0.15) : Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(imagePath),
            Gap(autoAdjustHeight(2)),
            Text(
              title,
              style: kCustomTextStyle(
                size: 10,
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        ),
      ),
    );
  }
}
