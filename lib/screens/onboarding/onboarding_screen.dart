import 'package:auto_adjust/auto_adjust.dart';
import 'package:extra_tech/util/color.dart';
import 'package:extra_tech/util/components/main_button.dart';
import 'package:extra_tech/util/components/padded.dart';
import 'package:extra_tech/util/constant.dart';
import 'package:extra_tech/util/navigations.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../auth/sign_in.dart';
import '../auth/sign_up.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  List<OnboardingData> onboardingData = [
    OnboardingData(
      title: 'Your local stores are a tap away.',
      subTitle:
          'Shop neighborhood favorites and national retailers, but leave the footwork to us.',
      imagePath: 'assets/images/onboarding1.png',
    ),
    OnboardingData(
      title: 'Your local stores are a tap away.',
      subTitle:
          'Shop neighborhood favorites and national retailers, but leave the footwork to us.',
      imagePath: 'assets/images/onboarding2.png',
    ),
    OnboardingData(
      title: 'Location Based Application.',
      subTitle:
          'Shop neighborhood favorites and national retailers, but leave the footwork to us.',
      imagePath: 'assets/images/onboarding3.png',
    ),
  ];
  final pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    //  var currentIndex = useState(0);
    return Scaffold(
      backgroundColor: kPRYCOLOUR,
      body: PageView.builder(
        onPageChanged: (value) {
          pageController.page == value;
          // currentIndex.value = value;
        },
        controller: pageController,
        itemCount: onboardingData.length,
        itemBuilder: (context, index) {
          return OnboardingSectionWidget(
            imagePath: onboardingData[index].imagePath,
            subTitle: onboardingData[index].subTitle,
            title: onboardingData[index].title,
            currentIndex: index,
            onNextPress: () {
              if (index != onboardingData.length - 1) {
                pageController.nextPage(
                  duration: const Duration(milliseconds: 800),
                  curve: Curves.bounceInOut,
                );
              }
            },
          );
        },
      ),
    );
  }
}

class OnboardingSectionWidget extends StatelessWidget {
  const OnboardingSectionWidget(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.imagePath,
      required this.currentIndex,
      required this.onNextPress});

  final String title, subTitle, imagePath;
  final int currentIndex;
  final Function() onNextPress;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: autoAdjustHeight(392),
          width: double.maxFinite,
          child: Image.asset(
            imagePath,
            fit: BoxFit.fill,
          ),
        ),
        Padded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(
                autoAdjustHeight(20),
              ),
              SizedBox(
                height: autoAdjustHeight(37),
                width: autoAdjustWidth(140),
                child: Image.asset('assets/images/extratechLogo.png'),
              ),
              Gap(
                autoAdjustHeight(20),
              ),
              Text(
                title,
                style: kCustomTextStyle(
                  size: 32,
                  fontWeight: FontWeight.w800,
                  color: kWHTCOLOUR,
                ),
              ),
              Gap(
                autoAdjustHeight(20),
              ),
              Text(
                subTitle,
                style: kCustomTextStyle(
                  size: 16,
                  fontWeight: FontWeight.w500,
                  color: kWHTCOLOUR,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Padded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: currentIndex != 2
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: autoAdjustHeight(5),
                              backgroundColor: currentIndex == 0
                                  ? kWHTCOLOUR
                                  : const Color(0xFFC7C7C7).withOpacity(0.3),
                            ),
                            Gap(autoAdjustWidth(5)),
                            CircleAvatar(
                              radius: autoAdjustHeight(4),
                              backgroundColor: currentIndex == 1
                                  ? kWHTCOLOUR
                                  : const Color(0xFFC7C7C7).withOpacity(0.3),
                            ),
                            Gap(autoAdjustWidth(5)),
                            CircleAvatar(
                              radius: autoAdjustHeight(3),
                              backgroundColor: currentIndex == 2
                                  ? kWHTCOLOUR
                                  : const Color(0xFFC7C7C7).withOpacity(0.3),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'Skip',
                              style: kCustomTextStyle(
                                size: 14,
                                fontWeight: FontWeight.w800,
                                color: kWHTCOLOUR,
                              ),
                            ),
                            Gap(autoAdjustWidth(10)),
                            InkWell(
                              onTap: () {
                                onNextPress.call();
                              },
                              child: SizedBox(
                                height: autoAdjustHeight(45),
                                width: autoAdjustWidth(45),
                                child: SvgPicture.asset(
                                    'assets/svgs/Button_forward.svg'),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  : ExtraTechMainButton(
                      text: 'Get Started',
                      onTap: () {
                        showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          builder: (context) {
                            return const GetStatedWidget();
                          },
                        );
                      },
                      backgroundColor: kWHTCOLOUR,
                      cornerRadius: 30,
                      textColor: kPRYCOLOUR,
                    ),
            ),
          ),
        ),
        Gap(
          autoAdjustHeight(30),
        ),
      ],
    );
  }
}

class GetStatedWidget extends StatefulHookWidget {
  const GetStatedWidget({
    super.key,
  });

  @override
  State<GetStatedWidget> createState() => _GetStatedWidgetState();
}

class _GetStatedWidgetState extends State<GetStatedWidget> {
  late LongPressGestureRecognizer _longPressRecognizer;

  @override
  void initState() {
    super.initState();
    _longPressRecognizer = LongPressGestureRecognizer(
        duration: const Duration(
      milliseconds: 100,
    ));
  }

  @override
  void dispose() {
    _longPressRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var currentType = useState<BusinessType>(BusinessType.unknown);
    void handlePress() {
      RouteNavigators.routeReplace(
        context,
        const SignInScreen(),
      );
    }

    List<BusinessTypeData> businessTypeDate = [
      BusinessTypeData(
        title: 'i’m a manufacturer',
        subTitle: 'I need my products to reach our consumers',
        icon: 'assets/images/manufacture1.png',
        businessType: BusinessType.manufacturer,
      ),
      BusinessTypeData(
        title: 'i’m a distributor',
        subTitle: 'I need my products to reach our consumers',
        icon: 'assets/images/connection1.png',
        businessType: BusinessType.distributor,
      ),
      BusinessTypeData(
        title: 'i’m a retailer',
        subTitle: 'I need my products to reach our consumers',
        icon: 'assets/images/store1.png',
        businessType: BusinessType.retailer,
      ),
      BusinessTypeData(
        title: 'i’m an explorer',
        subTitle: 'I need my products to reach our consumers',
        icon: 'assets/images/research1.png',
        businessType: BusinessType.explorer,
      ),
    ];
    return Container(
      height: autoAdjustHeight(629),
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(autoAdjustHeight(15)),
          topRight: Radius.circular(autoAdjustHeight(15)),
        ),
        color: kWHTCOLOUR,
      ),
      child: Padded(
        child: Column(
          children: [
            Gap(autoAdjustHeight(6)),
            SizedBox(
              width: autoAdjustWidth(54),
              child: Divider(
                thickness: autoAdjustHeight(3),
                color: kBLKCOLOUR,
              ),
            ),
            Gap(autoAdjustHeight(6)),
            SvgPicture.asset('assets/svgs/logo.svg'),
            Gap(autoAdjustHeight(8)),
            Text(
              'Automate your busywork',
              style: kCustomTextStyle(
                size: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            Gap(autoAdjustHeight(8)),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: autoAdjustWidth(30),
              ),
              child: Text(
                'Are you a Manufacturer, Distributor, Retailer or an Explorer ?',
                textAlign: TextAlign.center,
                style: kCustomTextStyle(
                  size: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Gap(autoAdjustHeight(16)),
            for (int index = 0; index < businessTypeDate.length; index++)
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: autoAdjustHeight(8),
                ),
                child: GestureDetector(
                  onTap: () {
                    currentType.value = businessTypeDate[index].businessType;
                  },
                  child: BusinessTypeWidget(
                    businessTypeData: businessTypeDate[index],
                    currentTypeSelected: currentType.value,
                  ),
                ),
              ),
            Gap(autoAdjustHeight(18)),
            Visibility(
              visible: currentType.value != BusinessType.unknown,
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      RouteNavigators.route(
                          context,
                          SignUpScreen(
                            businessType: currentType.value,
                          ));
                    },
                    child: Text(
                      'Sign Up',
                      style: kCustomTextStyle(
                          size: 14, fontWeight: FontWeight.w800),
                    ),
                  ),
                  Gap(autoAdjustHeight(18)),
                ],
              ),
            ),
            Text.rich(
              TextSpan(
                text: 'Already have an account?',
                style: kCustomTextStyle(size: 12, fontWeight: FontWeight.w400),
                children: [
                  TextSpan(
                    text: ' Log in',
                    style:
                        kCustomTextStyle(size: 13, fontWeight: FontWeight.w700),
                    recognizer: _longPressRecognizer..onLongPress = handlePress,
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

enum BusinessType { manufacturer, distributor, retailer, explorer, unknown }

class BusinessTypeData {
  final String title;
  final String subTitle;
  final String icon;
  final BusinessType businessType;
  BusinessTypeData({
    required this.title,
    required this.subTitle,
    required this.icon,
    required this.businessType,
  });
}

class BusinessTypeWidget extends StatelessWidget {
  const BusinessTypeWidget({
    super.key,
    required this.businessTypeData,
    required this.currentTypeSelected,
  });
  final BusinessTypeData businessTypeData;
  final BusinessType currentTypeSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: autoAdjustHeight(62),
      width: double.maxFinite,
      decoration: BoxDecoration(
        border: Border.all(
          color: currentTypeSelected != businessTypeData.businessType
              ? kBGColor
              : const Color(0xFF050247),
          width: autoAdjustHeight(2),
        ),
        borderRadius: BorderRadius.circular(autoAdjustHeight(5)),
        color: currentTypeSelected != businessTypeData.businessType
            ? Colors.transparent
            : const Color(0xFFEBEAFF),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: autoAdjustWidth(10),
          vertical: autoAdjustHeight(10),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: autoAdjustHeight(32),
              width: autoAdjustWidth(32),
              child: Image.asset(businessTypeData.icon),
            ),
            Gap(autoAdjustWidth(11)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    businessTypeData.title,
                    style: kCustomTextStyle(
                      size: 14,
                      fontWeight: FontWeight.w400,
                      color: kBLKCOLOUR,
                    ),
                  ),
                  Gap(autoAdjustHeight(2)),
                  Text(
                    businessTypeData.subTitle,
                    style: kCustomTextStyle(
                      size: 12,
                      fontWeight: FontWeight.w400,
                      color: kBLKCOLOUR,
                    ),
                  )
                ],
              ),
            ),
            Gap(autoAdjustWidth(11)),
            currentTypeSelected != businessTypeData.businessType
                ? SvgPicture.asset('assets/svgs/Ellipse6.svg')
                : SvgPicture.asset('assets/svgs/checked-svgrepo-com.svg')
          ],
        ),
      ),
    );
  }
}

class OnboardingData {
  final String title, subTitle, imagePath;

  OnboardingData({
    required this.title,
    required this.subTitle,
    required this.imagePath,
  });
}
