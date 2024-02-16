import 'package:auto_adjust/auto_adjust.dart';
import 'package:extra_tech/util/components/padded.dart';
import 'package:extra_tech/util/constant.dart';
import 'package:extra_tech/util/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../settings_screen.dart';

class PasswordManagementScreen extends StatefulHookConsumerWidget {
  const PasswordManagementScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PasswordManagementScreenState();
}

class _PasswordManagementScreenState
    extends ConsumerState<PasswordManagementScreen> {
  @override
  Widget build(BuildContext context) {
    var passwordController = useTextEditingController();
    var confirmPasswordController = useTextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Change Password',
          style: kCustomTextStyle(
            size: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Padded(
        child: Column(
          children: [
            PackageContainer(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Current Password',
                  style: kCustomTextStyle(
                    size: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    hintText: 'Enter password',
                    border: InputBorder.none,
                    suffixIcon: Padding(
                      padding: EdgeInsets.all(
                        autoAdjustHeight(16.0),
                      ),
                      child: SvgPicture.asset(
                        'assets/svgs/eye-off-svgrepo-com1.svg',
                      ),
                    ),
                  ),
                  validator: (value) => Validators.validatePassword(value),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
              ],
            )),
            Gap(autoAdjustHeight(25)),
            PackageContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'New Password',
                    style: kCustomTextStyle(
                      size: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      hintText: 'Enter password',
                      border: InputBorder.none,
                      suffixIcon: Padding(
                        padding: EdgeInsets.all(
                          autoAdjustHeight(16.0),
                        ),
                        child: SvgPicture.asset(
                          'assets/svgs/eye-off-svgrepo-com1.svg',
                        ),
                      ),
                    ),
                    validator: (value) => Validators.validatePassword(value),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  Gap(autoAdjustHeight(10)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for (var index = 0; index < 4; index++)
                        Container(
                          width: autoAdjustWidth(67),
                          height: autoAdjustHeight(2),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(autoAdjustHeight(3)),
                              color: Color(0xFFB6B6B6)),
                        ),
                    ],
                  ),
                  Gap(autoAdjustHeight(28)),
                  Row(
                    children: [
                      CircleAvatar(
                        maxRadius: autoAdjustHeight(4),
                        backgroundColor: Color(0xFFB6B6B6),
                      ),
                      Gap(autoAdjustWidth(15)),
                      Text(
                        'At least 12 character',
                        style: kCustomTextStyle(
                          fontWeight: FontWeight.w400,
                          size: 10,
                          color: Color(0xFFB6B6B6),
                        ),
                      )
                    ],
                  ),
                  Gap(autoAdjustHeight(10)),
                  Row(
                    children: [
                      CircleAvatar(
                        maxRadius: autoAdjustHeight(4),
                        backgroundColor: Color(0xFFB6B6B6),
                      ),
                      Gap(autoAdjustWidth(15)),
                      Text(
                        '1 Uppercase letter',
                        style: kCustomTextStyle(
                          fontWeight: FontWeight.w400,
                          size: 10,
                          color: Color(0xFFB6B6B6),
                        ),
                      )
                    ],
                  ),
                  Gap(autoAdjustHeight(10)),
                  Row(
                    children: [
                      CircleAvatar(
                        maxRadius: autoAdjustHeight(4),
                        backgroundColor: Color(0xFFB6B6B6),
                      ),
                      Gap(autoAdjustWidth(15)),
                      Text(
                        '1 Numeric character',
                        style: kCustomTextStyle(
                          fontWeight: FontWeight.w400,
                          size: 10,
                          color: Color(0xFFB6B6B6),
                        ),
                      )
                    ],
                  ),
                  Gap(autoAdjustHeight(10)),
                  Row(
                    children: [
                      CircleAvatar(
                        maxRadius: autoAdjustHeight(4),
                        backgroundColor: Color(0xFFB6B6B6),
                      ),
                      Gap(autoAdjustWidth(15)),
                      Text(
                        '1 Special character',
                        style: kCustomTextStyle(
                          fontWeight: FontWeight.w400,
                          size: 10,
                          color: Color(0xFFB6B6B6),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Gap(autoAdjustHeight(10)),
            PackageContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Confirm password',
                    style: kCustomTextStyle(
                      size: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextFormField(
                    controller: confirmPasswordController,
                    decoration: InputDecoration(
                      hintText: 'Enter password',
                      border: InputBorder.none,
                      suffixIcon: Padding(
                        padding: EdgeInsets.all(
                          autoAdjustHeight(16.0),
                        ),
                        child: SvgPicture.asset(
                          'assets/svgs/eye-off-svgrepo-com1.svg',
                        ),
                      ),
                    ),
                    validator: (value) => Validators.validatePassword(value),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
