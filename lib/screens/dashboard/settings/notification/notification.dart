import 'package:auto_adjust/auto_adjust.dart';
import 'package:extra_tech/util/components/padded.dart';
import 'package:extra_tech/util/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NotificationScreen extends StatefulHookConsumerWidget {
  const NotificationScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _NotificationScreenState();
}

class _NotificationScreenState extends ConsumerState<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    var dailyBrifing = useState(false);
    var breakingNews = useState(false);
    var communityNotification = useState(false);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notification',
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
            Padding(
              padding: EdgeInsets.all(autoAdjustHeight(8.0)),
              child: Row(
                children: [
                  Expanded(
                    child: Text.rich(
                      TextSpan(
                        text: 'Daily briefing',
                        style: kCustomTextStyle(
                          size: 14,
                          fontWeight: FontWeight.w700,
                        ),
                        children: [
                          TextSpan(
                            text:
                                '\nGet your personalized daily briefing in your inbox',
                            style: kCustomTextStyle(
                              size: 12,
                              fontWeight: FontWeight.w400,
                            ),
                            children: [],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Gap(autoAdjustWidth(80)),
                  Switch(
                    value: dailyBrifing.value,
                    onChanged: (value) {
                      dailyBrifing.value = value;
                    },
                  )
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.all(autoAdjustHeight(8.0)),
              child: Row(
                children: [
                  Expanded(
                    child: Text.rich(
                      TextSpan(
                        text: 'Breaking news',
                        style: kCustomTextStyle(
                          size: 14,
                          fontWeight: FontWeight.w700,
                        ),
                        children: [
                          TextSpan(
                            text:
                                '\nAlerts for the most important prices on products.',
                            style: kCustomTextStyle(
                              size: 12,
                              fontWeight: FontWeight.w400,
                            ),
                            children: [],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Gap(autoAdjustWidth(80)),
                  Switch(
                    value: breakingNews.value,
                    onChanged: (value) {
                      breakingNews.value = value;
                    },
                  )
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.all(autoAdjustHeight(8.0)),
              child: Row(
                children: [
                  Expanded(
                    child: Text.rich(
                      TextSpan(
                        text: 'Community notifications',
                        style: kCustomTextStyle(
                          size: 14,
                          fontWeight: FontWeight.w700,
                        ),
                        children: [
                          TextSpan(
                            text:
                                '\nGet notified when a you’ve been added to the customer’s list.',
                            style: kCustomTextStyle(
                              size: 12,
                              fontWeight: FontWeight.w400,
                            ),
                            children: [],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Gap(autoAdjustWidth(80)),
                  Switch(
                    value: communityNotification.value,
                    onChanged: (value) {
                      communityNotification.value = value;
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
