import 'package:auto_adjust/auto_adjust.dart';
import 'package:extra_tech/util/components/padded.dart';
import 'package:extra_tech/util/constant.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FavoriteScreen extends StatefulHookConsumerWidget {
  const FavoriteScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends ConsumerState<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Favorite Products',
          style: kCustomTextStyle(
            size: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Padded(
        child: Column(
          children: [
            Column(
              children: [
                Gap(autoAdjustHeight(45)),
                SizedBox(
                  height: autoAdjustHeight(355),
                  width: autoAdjustWidth(310),
                  child: Image.asset('assets/images/favourite_products.png'),
                ),
                Text(
                  'Favorite Products',
                  style: kCustomTextStyle(
                    size: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Gap(autoAdjustHeight(5)),
                Center(
                  child: Text(
                    'No Products Found',
                    style: kCustomTextStyle(
                      size: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
