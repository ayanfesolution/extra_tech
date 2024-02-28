import 'package:auto_adjust/auto_adjust.dart';
import 'package:extra_tech/util/components/padded.dart';
import 'package:extra_tech/util/constant.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'search_screen.dart';

class MainSearchingScreen extends StatefulHookConsumerWidget {
  const MainSearchingScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MainSearchingScreenState();
}

class _MainSearchingScreenState extends ConsumerState<MainSearchingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Padded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(autoAdjustHeight(15)),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(
                    autoAdjustHeight(20),
                  ),
                ),
                fillColor: const Color(0xFFF0F5F5),
                filled: true,
              ),
              enabled: true,
              autofocus: true,
            ),
            Gap(autoAdjustHeight(15)),
            Text(
              'Gas station near you',
              style: kCustomTextStyle(
                size: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            Gap(autoAdjustHeight(15)),
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
