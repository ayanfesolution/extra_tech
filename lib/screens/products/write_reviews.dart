import 'package:auto_adjust/auto_adjust.dart';
import 'package:extra_tech/screens/dashboard/bottom_nav_bar.dart';
import 'package:extra_tech/screens/products/product_details.dart';
import 'package:extra_tech/util/components/main_button.dart';
import 'package:extra_tech/util/components/padded.dart';
import 'package:extra_tech/util/constant.dart';
import 'package:extra_tech/util/navigations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WriteReviewScreen extends StatefulHookConsumerWidget {
  const WriteReviewScreen({
    super.key,
    required this.currentStarRating,
  });
  final ValueNotifier currentStarRating;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _WriteReviewScreenState();
}

class _WriteReviewScreenState extends ConsumerState<WriteReviewScreen> {
  @override
  Widget build(BuildContext context) {
    var currentStarRating = useState(widget.currentStarRating.value);
    var reviewTitle = useTextEditingController();
    var reviewDescription = useTextEditingController();
    var isRecommendationSelected = useState(false);
    return Scaffold(
      body: Padded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(
              autoAdjustHeight(46),
            ),
            const ProductPageHeader(),
            Gap(
              autoAdjustHeight(30),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  Column(
                    children: [
                      Row(
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
                                widget.currentStarRating.value = index;
                                currentStarRating.value = index;
                              },
                              child: Icon(
                                Icons.star_rate,
                                size: autoAdjustHeight(16),
                                color: index < currentStarRating.value + 1
                                    ? const Color(0xFFFBBC04)
                                    : const Color(0xFFD9D9E3),
                              ),
                            ),
                        ],
                      ),
                      const Divider(),
                    ],
                  ),
                  Gap(autoAdjustHeight(20)),
                  ExtraTechDesignerTextField(
                    controller: reviewTitle,
                    title: 'Set a Title for your review',
                    hint: 'Summarise review',
                  ),
                  Gap(autoAdjustHeight(20)),
                  ExtraTechDesignerTextField(
                    controller: reviewDescription,
                    title: 'What did you like or dislike?',
                    hint: 'What should shoppers know before?',
                    maxLine: 4,
                  ),
                  Gap(autoAdjustHeight(20)),
                  const Divider(),
                  Gap(autoAdjustHeight(34)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Would you recommend \nthis product?',
                        style: kCustomTextStyle(
                          size: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Switch(
                        value: isRecommendationSelected.value,
                        onChanged: (value) {
                          isRecommendationSelected.value = value;
                        },
                      )
                    ],
                  ),
                ],
              ),
            ),
            ExtraTechMainButton(
              text: 'Submit Review',
              onTap: () {
                RouteNavigators.routeNoWayHome(
                  context,
                  const BottomNavBar(),
                );
              },
              cornerRadius: 10,
            ),
            Gap(autoAdjustHeight(35)),
          ],
        ),
      ),
    );
  }
}

class ExtraTechDesignerTextField extends StatelessWidget {
  const ExtraTechDesignerTextField({
    super.key,
    required this.controller,
    required this.title,
    required this.hint,
    this.maxLine = 1,
  });
  final String title, hint;
  final TextEditingController controller;
  final int maxLine;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: kCustomTextStyle(
            size: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
        Gap(autoAdjustHeight(12)),
        TextFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(
                autoAdjustHeight(10),
              ),
            ),
            hintText: hint,
            fillColor: const Color(0xFFEDEFF8),
            filled: true,
          ),
          maxLines: maxLine,
        ),
      ],
    );
  }
}
