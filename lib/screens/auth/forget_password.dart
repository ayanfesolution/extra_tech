import 'package:auto_adjust/auto_adjust.dart';
import 'package:extra_tech/util/components/main_button.dart';
import 'package:extra_tech/util/components/padded.dart';
import 'package:extra_tech/util/constant.dart';
import 'package:extra_tech/util/navigations.dart';
import 'package:extra_tech/util/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'sign_in.dart';

class ForgetPasswordScreen extends StatefulHookConsumerWidget {
  const ForgetPasswordScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends ConsumerState<ForgetPasswordScreen> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var emailName = useTextEditingController();
    return Scaffold(
      body: Padded(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(autoAdjustHeight(68)),
                  InkWell(
                      onTap: () {
                        RouteNavigators.pop(context);
                      },
                      child: SvgPicture.asset(
                          'assets/svgs/arrow-back-simple-svgrepo-com.svg')),
                  Gap(autoAdjustHeight(25)),
                  Text(
                    'Forget Password',
                    style: kCustomTextStyle(
                      size: 34,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Gap(autoAdjustHeight(5)),
                  Text(
                    'Enter your email to get your reset link.',
                    style: kCustomTextStyle(
                      size: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Gap(autoAdjustHeight(25)),
                  ExtraTechTextFieldWidget(
                    userName: emailName,
                    hintText: 'Email Address',
                    validator: (p0) => Validators.validateEmail(p0 ?? ''),
                    suffixIcon: Padding(
                      padding: EdgeInsets.all(autoAdjustHeight(16.0)),
                      child: SvgPicture.asset(
                          'assets/svgs/edit-2-svgrepo-com(1)1.svg'),
                    ),
                  ),
                  Gap(autoAdjustHeight(25)),
                ],
              ),
              Expanded(
                  child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(
                    bottom: autoAdjustHeight(45),
                  ),
                  child: ExtraTechMainButton(
                    text: 'Reset Password',
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        RouteNavigators.route(
                          context,
                          const SignInScreen(),
                        );
                      }
                    },
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
