import 'package:auto_adjust/auto_adjust.dart';
import 'package:extra_tech/screens/seller_side/Profile/profile_dart.dart';
import 'package:extra_tech/util/color.dart';
import 'package:extra_tech/util/constant.dart';
import 'package:extra_tech/util/navigations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../product/product.dart';

class SellerDashboard extends StatelessWidget {
  const SellerDashboard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topRight,
          child: Container(
            height: autoAdjustHeight(185),
            width: autoAdjustWidth(266),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/Ellipseyh23.png',
                ),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: EdgeInsets.only(
              top: autoAdjustHeight(45),
              right: autoAdjustWidth(22),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: SvgPicture.asset(
                    'assets/svgs/notification-bell-svgrepo-com1.svg',
                  ),
                ),
                Gap(autoAdjustWidth(20)),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: SvgPicture.asset(
                    'assets/svgs/menu-alt-01-svgrepo-com3.svg',
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: autoAdjustHeight(133),
            left: autoAdjustWidth(20),
          ),
          child: Row(
            children: [
              CircleAvatar(
                child: Image.asset(
                  'assets/images/profi.png',
                  fit: BoxFit.fill,
                ),
              ),
              Gap(autoAdjustWidth(10)),
              Text.rich(
                TextSpan(
                  text: 'TotalEnergies Store',
                  style: kCustomTextStyle(
                    size: 16,
                    fontWeight: FontWeight.w700,
                  ),
                  children: [
                    TextSpan(
                      text: '\nCategory: ',
                      style: kCustomTextStyle(
                        size: 11,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextSpan(
                      text: 'Manufacturer',
                      style: kCustomTextStyle(
                        size: 11,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: autoAdjustHeight(540),
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: kPRYCOLOUR,
              borderRadius: BorderRadiusDirectional.vertical(
                top: Radius.circular(
                  autoAdjustHeight(25),
                ),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: autoAdjustHeight(418),
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: kWHTCOLOUR,
                    borderRadius: BorderRadiusDirectional.vertical(
                      top: Radius.circular(
                        autoAdjustHeight(25),
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: autoAdjustWidth(30),
                      vertical: autoAdjustHeight(41),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DesignContainerSeller(
                          onTap: () {
                            RouteNavigators.route(
                              context,
                              ProductScreen(),
                            );
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SvgPicture.asset(
                                'assets/svgs/Vectorcopy.svg',
                              ),
                              Text(
                                'Product Management',
                                textAlign: TextAlign.center,
                                style: kCustomTextStyle(
                                  size: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              )
                            ],
                          ),
                        ),
                        DesignContainerSeller(
                          onTap: () {
                            RouteNavigators.route(
                              context,
                              ProfileSellerScreen(),
                            );
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SvgPicture.asset(
                                'assets/svgs/setting-2-svgrepo-com4.svg',
                              ),
                              Text(
                                'Settings',
                                textAlign: TextAlign.center,
                                style: kCustomTextStyle(
                                  size: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class DesignContainerSeller extends StatelessWidget {
  const DesignContainerSeller({
    super.key,
    required this.onTap,
    required this.child,
  });
  final Function() onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: autoAdjustHeight(144),
        width: autoAdjustWidth(149),
        decoration: BoxDecoration(
          color: kWHTCOLOUR,
          borderRadius: BorderRadius.circular(autoAdjustHeight(10)),
          boxShadow: [
            BoxShadow(
              blurRadius: autoAdjustHeight(12),
              spreadRadius: 0,
              color: const Color(0xFFC7C7C7).withOpacity(0.37),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(
            autoAdjustHeight(18),
          ),
          child: child,
        ),
      ),
    );
  }
}
