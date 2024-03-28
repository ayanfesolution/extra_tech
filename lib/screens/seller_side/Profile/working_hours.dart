import 'dart:ffi';

import 'package:auto_adjust/auto_adjust.dart';
import 'package:extra_tech/screens/seller_side/Profile/profile_dart.dart';
import 'package:extra_tech/util/components/main_button.dart';
import 'package:extra_tech/util/components/padded.dart';
import 'package:extra_tech/util/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WorkingHoursScreen extends StatefulHookConsumerWidget {
  const WorkingHoursScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _WorkingHoursScreenState();
}

class _WorkingHoursScreenState extends ConsumerState<WorkingHoursScreen> {
  @override
  Widget build(BuildContext context) {
    List<String> daysOfTheWeek = [
      'Sunday',
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday'
    ];
    List<String> morningHours = [
      '12:00 AM',
      '01:00 AM',
      '02:00 AM',
      '03:00 AM',
      '04:00 AM',
      '05:00 AM',
      '06:00 AM',
      '07:00 AM',
      '08:00 AM',
      '09:00 AM',
      '10:00 AM',
      '11:00 AM',
    ];
    List<String> afternoonHours = [
      '12:00 PM',
      '01:00 PM',
      '02:00 PM',
      '03:00 PM',
      '04:00 PM',
      '05:00 PM',
      '06:00 PM',
      '07:00 PM',
      '08:00 PM',
      '09:00 PM',
      '10:00 PM',
      '11:00 PM',
    ];
    var startDay = useState('');
    var startHour = useState('');
    var endDay = useState('');
    var endHour = useState('');
    var isItOpen = useState(false);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Work Hours',
          style: kCustomTextStyle(
            size: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Padded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Divider(),
            Gap(autoAdjustHeight(10)),
            Text(
              'Configure the standard hours of work operation',
              style: kCustomTextStyle(
                size: 14,
                fontWeight: FontWeight.w300,
              ),
            ),
            Gap(autoAdjustHeight(25)),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: autoAdjustWidth(15),
                vertical: autoAdjustHeight(18),
              ),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFC7C7C7).withOpacity(0.37),
                    blurRadius: 12,
                    spreadRadius: 0,
                  )
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  autoAdjustHeight(15),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Days',
                        style: kCustomTextStyle(
                          size: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Row(
                        children: [
                          Switch(
                            value: isItOpen.value,
                            onChanged: (value) {
                              isItOpen.value = value;
                            },
                          ),
                          Text(
                            isItOpen.value ? 'Open' : 'Close',
                            style: kCustomTextStyle(
                              size: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  Gap(autoAdjustHeight(20)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      WorkingDayContainer(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return Dialog(
                                backgroundColor: Colors.white,
                                shape: ContinuousRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    autoAdjustHeight(25),
                                  ),
                                ),
                                child: OptionBox(
                                  listDetails: daysOfTheWeek,
                                  name: startDay,
                                ),
                              );
                            },
                          );
                        },
                        name: startDay.value,
                      ),
                      Text(
                        'To',
                        style: kCustomTextStyle(
                          size: 12,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      WorkingDayContainer(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return Dialog(
                                backgroundColor: Colors.white,
                                shape: ContinuousRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    autoAdjustHeight(25),
                                  ),
                                ),
                                child: OptionBox(
                                  listDetails: daysOfTheWeek,
                                  name: endDay,
                                ),
                              );
                            },
                          );
                        },
                        name: endDay.value,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Gap(autoAdjustHeight(25)),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: autoAdjustWidth(15),
                vertical: autoAdjustHeight(18),
              ),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFC7C7C7).withOpacity(0.37),
                    blurRadius: 12,
                    spreadRadius: 0,
                  )
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  autoAdjustHeight(15),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Working hours',
                        style: kCustomTextStyle(
                          size: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Gap(autoAdjustHeight(20)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      WorkingDayContainer(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return Dialog(
                                backgroundColor: Colors.white,
                                shape: ContinuousRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    autoAdjustHeight(25),
                                  ),
                                ),
                                child: OptionBox(
                                  listDetails: morningHours,
                                  name: startHour,
                                ),
                              );
                            },
                          );
                        },
                        name: startHour.value,
                      ),
                      Text(
                        'To',
                        style: kCustomTextStyle(
                          size: 12,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      WorkingDayContainer(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return Dialog(
                                backgroundColor: Colors.white,
                                shape: ContinuousRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    autoAdjustHeight(25),
                                  ),
                                ),
                                child: OptionBox(
                                  listDetails: afternoonHours,
                                  name: endHour,
                                ),
                              );
                            },
                          );
                        },
                        name: endHour.value,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Gap(
              autoAdjustHeight(30),
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: autoAdjustHeight(51),
                    width: autoAdjustWidth(100),
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(
                        autoAdjustHeight(15),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Cancel',
                        style: kCustomTextStyle(
                          fontWeight: FontWeight.w700,
                          size: 14,
                        ),
                      ),
                    ),
                  ),
                ),
                Gap(autoAdjustWidth(15)),
                ExtraTechMainButton(
                  backgroundColor: const Color(0xFF604ADB),
                  onTap: () {
                    Navigator.pop(context);
                  },
                  text: '  Save Schedule  ',
                  cornerRadius: 15,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class OptionBox extends StatelessWidget {
  const OptionBox({
    super.key,
    required this.listDetails,
    required this.name,
  });

  final List<String> listDetails;
  final ValueNotifier<String> name;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: autoAdjustHeight(480),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: autoAdjustWidth(15),
          vertical: autoAdjustHeight(23),
        ),
        child: ListView(
          // mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Text(
                'Choose Option',
                style: kCustomTextStyle(
                  size: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            for (var index = 0; index < listDetails.length; index++)
              ListTile(
                title: Text(
                  listDetails[index],
                  style: kCustomTextStyle(
                    fontWeight: FontWeight.w400,
                    size: 11,
                  ),
                ),
                onTap: () {
                  name.value = listDetails[index];
                  Navigator.pop(context);
                },
              ),
          ],
        ),
      ),
    );
  }
}

class WorkingDayContainer extends StatelessWidget {
  const WorkingDayContainer({
    super.key,
    required this.name,
    required this.onTap,
  });
  final String name;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: autoAdjustHeight(30),
        width: autoAdjustWidth(138),
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xFFB6B6B6),
          ),
          borderRadius: BorderRadius.circular(
            autoAdjustHeight(5),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: autoAdjustWidth(10), vertical: autoAdjustHeight(2)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: kCustomTextStyle(
                  size: 12,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const Icon(
                Icons.unfold_more_sharp,
              )
            ],
          ),
        ),
      ),
    );
  }
}
