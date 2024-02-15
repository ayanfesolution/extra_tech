import 'package:auto_adjust/auto_adjust.dart';
import 'package:extra_tech/screens/products/write_reviews.dart';
import 'package:extra_tech/util/color.dart';
import 'package:extra_tech/util/components/main_button.dart';
import 'package:extra_tech/util/components/padded.dart';
import 'package:extra_tech/util/constant.dart';
import 'package:extra_tech/util/navigations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'all_review.dart';

class ProductDetailsScreen extends StatefulHookConsumerWidget {
  const ProductDetailsScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends ConsumerState<ProductDetailsScreen> {
  PageController mainPictures = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    var isItFavourite = useState(false);
    var currentSelction = useState(0);
    var currentRatingSelction = useState(0);
    var currentImagePageSelction = useState(0);
    List<String> imagePathLoading = [
      'assets/images/images(39)1.png',
      'assets/images/productImage2.png',
      'assets/images/images3(39)1.png',
    ];
    return Scaffold(
      body: Padded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(autoAdjustHeight(50)),
            const ProductPageHeader(),
            Gap(autoAdjustHeight(33)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'QUARTZ 5000',
                  style: kCustomTextStyle(
                    size: 26,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    isItFavourite.value = !isItFavourite.value;
                  },
                  child: Icon(
                    isItFavourite.value
                        ? Icons.favorite_outlined
                        : Icons.favorite_outline,
                    color: isItFavourite.value
                        ? Colors.red
                        : const Color(0xFFB6B6B6),
                  ),
                )
              ],
            ),
            Text(
              'Type: Motor Oil 15W20',
              style: kCustomTextStyle(
                size: 14,
                fontWeight: FontWeight.w400,
                color: const Color(0xFFB6B6B6),
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  SizedBox(
                    height: autoAdjustHeight(230),
                    child: PageView.builder(
                        itemCount: imagePathLoading.length,
                        controller: mainPictures,
                        onPageChanged: (value) {
                          currentImagePageSelction.value = value;
                        },
                        itemBuilder: (context, snapshot) {
                          return SizedBox(
                            height: autoAdjustHeight(230),
                            width: autoAdjustWidth(230),
                            child: Image.asset(
                              'assets/images/productImage2.png',
                            ),
                          );
                        }),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (var index = 0;
                          index < imagePathLoading.length;
                          index++)
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color:
                                        currentImagePageSelction.value == index
                                            ? Colors.black
                                            : const Color(0xFFEDEFF1))),
                            child: SizedBox(
                              height: autoAdjustHeight(
                                  currentImagePageSelction.value == index
                                      ? 70
                                      : 50),
                              width: autoAdjustWidth(
                                  currentImagePageSelction.value == index
                                      ? 70
                                      : 50),
                              child: Image.asset(
                                'assets/images/productImage2.png',
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                  Gap(autoAdjustWidth(30)),
                  BackgroundCornerDesign(
                    child: Row(
                      children: [
                        SizedBox(
                          height: autoAdjustHeight(54),
                          width: autoAdjustWidth(60),
                          child:
                              Image.asset('assets/images/totalenergies1.png'),
                        ),
                        Gap(autoAdjustWidth(19)),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'TotalEnergies Store',
                                style: kCustomTextStyle(
                                  size: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                'View store',
                                style: kCustomTextStyle(
                                  size: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            ],
                          ),
                        ),
                        Padded(
                          child: Container(
                            height: autoAdjustHeight(32),
                            width: autoAdjustWidth(32),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                autoAdjustHeight(8),
                              ),
                            ),
                            child: const Icon(
                              Icons.arrow_forward_ios_outlined,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Gap(autoAdjustHeight(28)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          currentSelction.value = 0;
                        },
                        child: ActionList(
                          title: 'Product info',
                          isItTheCurrent: currentSelction.value == 0,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          currentSelction.value = 1;
                        },
                        child: ActionList(
                          title: 'Review',
                          isItTheCurrent: currentSelction.value == 1,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          currentSelction.value = 2;
                        },
                        child: ActionList(
                          title: 'Add Review',
                          isItTheCurrent: currentSelction.value == 2,
                        ),
                      )
                    ],
                  ),
                  Gap(autoAdjustHeight(20)),
                  Visibility(
                    visible: currentSelction.value == 0,
                    child: Column(
                      children: [
                        Text(
                          'The QUARTZ 5000 Motor Oil 15W20 is one of the world best motor oil used to cover the most stringent requirements of both gasoline and diesel engines suits passenger cars as well as light industrial vehicles.',
                          style: kCustomTextStyle(
                            fontWeight: FontWeight.w400,
                            size: 13,
                          ),
                        ),
                        Gap(autoAdjustHeight(35)),
                        Row(
                          children: [
                            SizedBox(
                              width: autoAdjustWidth(180),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Price',
                                    style: kCustomTextStyle(
                                      fontWeight: FontWeight.w700,
                                      size: 14,
                                    ),
                                  ),
                                  Gap(autoAdjustHeight(3)),
                                  Text(
                                    'USD 520.99',
                                    style: kCustomTextStyle(
                                      fontWeight: FontWeight.w700,
                                      size: 14,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: ExtraTechMainButton(
                                cornerRadius: autoAdjustHeight(10),
                                text: 'Get the Route',
                                onTap: () {},
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: currentSelction.value == 1,
                    child: GestureDetector(
                      onTap: () {
                        RouteNavigators.route(
                          context,
                          const AllReviewsScreen(),
                        );
                      },
                      child: BackgroundCornerDesign(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: autoAdjustWidth(16),
                              vertical: autoAdjustHeight(15)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text.rich(
                                    TextSpan(
                                        text: '3.9',
                                        style: kCustomTextStyle(
                                          size: 24,
                                          fontWeight: FontWeight.w700,
                                        ),
                                        children: [
                                          TextSpan(
                                            text: '/5',
                                            style: kCustomTextStyle(
                                              size: 12,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ]),
                                  ),
                                  Text(
                                    'Based on 120 Reviews',
                                    style: kCustomTextStyle(
                                      size: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Gap(
                                    autoAdjustHeight(11),
                                  ),
                                  Row(
                                    children: [
                                      for (var index = 0; index < 5; index++)
                                        Icon(
                                          Icons.star_rate,
                                          color: index < 4
                                              ? const Color(0xFFFBBC04)
                                              : const Color(0xFFD9D9E3),
                                        ),
                                    ],
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  for (var index = 0; index < 5; index++)
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: autoAdjustHeight(5)),
                                      child: Row(
                                        children: [
                                          Text(
                                            '${5 - index} Star',
                                            style: kCustomTextStyle(
                                              size: 10,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          Gap(autoAdjustWidth(5)),
                                          Container(
                                            height: autoAdjustHeight(5),
                                            width: autoAdjustWidth(64),
                                            decoration: BoxDecoration(
                                              color: const Color(0xFFD9D9E3),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                autoAdjustHeight(30),
                                              ),
                                            ),
                                            child: Row(
                                              children: [
                                                Container(
                                                  height: autoAdjustHeight(5),
                                                  width: autoAdjustWidth(
                                                      (5 - index) / 5 * 64),
                                                  decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xFFFBBC04),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      autoAdjustHeight(30),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: currentSelction.value == 2,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              height: autoAdjustHeight(54),
                              width: autoAdjustWidth(60),
                              child: Image.asset(
                                  'assets/images/totalenergies1.png'),
                            ),
                            Gap(autoAdjustWidth(19)),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'TotalEnergies Store',
                                    style: kCustomTextStyle(
                                      size: 12,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  Text(
                                    'QUARTZ 5000',
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
                        Gap(autoAdjustHeight(20)),
                        const Divider(),
                        Text(
                          'Your overall rating of this product',
                          style: kCustomTextStyle(
                            size: 11,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Gap(autoAdjustHeight(17)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            for (var index = 0; index < 5; index++)
                              GestureDetector(
                                onTap: () {
                                  currentRatingSelction.value = index;
                                  RouteNavigators.route(
                                    context,
                                    WriteReviewScreen(
                                      currentStarRating: currentRatingSelction,
                                    ),
                                  );
                                },
                                child: Icon(
                                  Icons.star_rate,
                                  size: autoAdjustHeight(16),
                                  color: index < currentRatingSelction.value + 1
                                      ? const Color(0xFFFBBC04)
                                      : const Color(0xFFD9D9E3),
                                ),
                              ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductPageHeader extends StatelessWidget {
  const ProductPageHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => RouteNavigators.pop(context),
          child: SvgPicture.asset('assets/svgs/backUnique.svg'),
        ),
        Container(
          padding: EdgeInsets.all(
            autoAdjustHeight(8),
          ),
          color: const Color(
            0xFFF4F6FA,
          ).withOpacity(.9),
          child: Row(
            children: [
              Text(
                'Ask Seller',
                style: kCustomTextStyle(
                  fontWeight: FontWeight.w500,
                  size: 11,
                ),
              ),
              Gap(autoAdjustWidth(3)),
              SvgPicture.asset('assets/svgs/chat-svgrepo-comNew.svg')
            ],
          ),
        )
      ],
    );
  }
}

class ActionList extends StatelessWidget {
  const ActionList({
    super.key,
    required this.title,
    required this.isItTheCurrent,
  });
  final String title;
  final bool isItTheCurrent;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: kCustomTextStyle(
            fontWeight: isItTheCurrent ? FontWeight.w700 : FontWeight.w400,
            size: isItTheCurrent ? 14 : 13,
          ),
        ),
        Visibility(
          visible: isItTheCurrent,
          child: CircleAvatar(
            maxRadius: autoAdjustHeight(3),
            backgroundColor: kBLKCOLOUR,
          ),
        )
      ],
    );
  }
}

class BackgroundCornerDesign extends StatelessWidget {
  const BackgroundCornerDesign({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: autoAdjustWidth(5),
        vertical: autoAdjustHeight(5),
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFEDEFF8),
        borderRadius: BorderRadius.circular(
          autoAdjustHeight(10),
        ),
      ),
      child: child,
    );
  }
}
