import 'package:auto_adjust/auto_adjust.dart';
import 'package:extra_tech/screens/auth/profile_upload.dart';
import 'package:extra_tech/screens/auth/sign_in.dart';
import 'package:extra_tech/screens/onboarding/onboarding_screen.dart';
import 'package:extra_tech/util/components/main_button.dart';
import 'package:extra_tech/util/components/padded.dart';
import 'package:extra_tech/util/constant.dart';
import 'package:extra_tech/util/navigations.dart';
import 'package:extra_tech/util/validators.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignUpScreen extends StatefulHookConsumerWidget {
  const SignUpScreen({
    super.key,
    required this.businessType,
  });
  final BusinessType businessType;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  late LongPressGestureRecognizer longPressRecognizer;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    longPressRecognizer = LongPressGestureRecognizer(
        duration: const Duration(
      milliseconds: 100,
    ));
  }

  @override
  void dispose() {
    longPressRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var emailName = useTextEditingController(text: '');
    var password = useTextEditingController(text: '');
    var confirmPassword = useTextEditingController(text: '');
    void handlePress() {
      RouteNavigators.routeReplace(
        context,
        const SignInScreen(),
      );
    }

    return Scaffold(
      body: Padded(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(autoAdjustHeight(69)),
                InkWell(
                    onTap: () {
                      RouteNavigators.pop(context);
                    },
                    child: SvgPicture.asset(
                        'assets/svgs/arrow-back-simple-svgrepo-com.svg')),
                Gap(autoAdjustHeight(25)),
                Text(
                  'Sign Up',
                  style: kCustomTextStyle(
                    size: 34,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Gap(autoAdjustHeight(5)),
                Text(
                  'Require information to account creations.',
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
                ExtraTechTextFieldWidget(
                  userName: password,
                  hintText: 'Password',
                  validator: (p0) => Validators.validatePassword(p0 ?? ''),
                  suffixIcon: Padding(
                    padding: EdgeInsets.all(autoAdjustHeight(16.0)),
                    child: SvgPicture.asset(
                        'assets/svgs/eye-off-svgrepo-com1.svg'),
                  ),
                ),
                Gap(autoAdjustHeight(12)),
                ExtraTechTextFieldWidget(
                  userName: confirmPassword,
                  hintText: 'Confirm Password',
                  validator: (p0) => Validators.validateConfirmPassword(
                    p0 ?? '',
                    password.text,
                  ),
                  suffixIcon: Padding(
                    padding: EdgeInsets.all(autoAdjustHeight(16.0)),
                    child: SvgPicture.asset(
                        'assets/svgs/eye-off-svgrepo-com1.svg'),
                  ),
                ),
                Gap(autoAdjustHeight(80)),
                ExtraTechMainButton(
                  text: 'Sign Up',
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      RouteNavigators.route(
                        context,
                        const ProfileUploadScreen(),
                      );
                    }
                  },
                ),
                Gap(autoAdjustHeight(12)),
                Center(
                  child: Text.rich(
                    TextSpan(
                      text: 'Already have an account?',
                      style: kCustomTextStyle(
                          size: 12, fontWeight: FontWeight.w400),
                      children: [
                        TextSpan(
                          text: ' Sign In',
                          style: kCustomTextStyle(
                              size: 13, fontWeight: FontWeight.w700),
                          recognizer: longPressRecognizer
                            ..onLongPress = handlePress,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
