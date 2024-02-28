import 'package:auto_adjust/auto_adjust.dart';
import 'package:extra_tech/screens/products/product_details.dart';
import 'package:extra_tech/util/components/padded.dart';
import 'package:extra_tech/util/constant.dart';
import 'package:extra_tech/util/navigations.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'main_search.dart';

class SearchScreen extends StatefulHookConsumerWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Near You',
          style: kCustomTextStyle(
            size: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Padded(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                RouteNavigators.route(
                  context,
                  const MainSearchingScreen(),
                );
              },
              child: Container(
                height: autoAdjustHeight(46),
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    autoAdjustHeight(20),
                  ),
                  color: const Color(0xFFF0F5F5),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: autoAdjustHeight(11),
                    ),
                    child: const SingleProductDesign(
                      isMoreVisible: false,
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

class SingleProductDesign extends StatelessWidget {
  const SingleProductDesign({
    super.key,
    this.isMoreVisible = true,
  });
  final bool isMoreVisible;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        RouteNavigators.route(
          context,
          const ProductDetailsScreen(),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: autoAdjustHeight(14),
          horizontal: autoAdjustWidth(9),
        ),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: autoAdjustHeight(4),
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 0.3,
            )
          ],
          color: Colors.white,
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(
                autoAdjustHeight(5),
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xFFEDEFF1),
                ),
              ),
              child: SizedBox(
                height: autoAdjustHeight(45),
                width: autoAdjustWidth(45),
                child: Image.asset(
                  'assets/images/smallProductIcon.png',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Gap(autoAdjustWidth(12)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'QUARTZ 5000',
                    style: kCustomTextStyle(
                      fontWeight: FontWeight.w700,
                      size: 12,
                    ),
                  ),
                  Text(
                    'TotalEnergies Store',
                    style: kCustomTextStyle(
                      fontWeight: FontWeight.w300,
                      size: 10,
                    ),
                  )
                ],
              ),
            ),
            Visibility(
              visible: isMoreVisible,
              child: const Icon(Icons.more_horiz_rounded),
            )
          ],
        ),
      ),
    );
  }
}
