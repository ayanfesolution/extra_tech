import 'package:auto_adjust/auto_adjust.dart';
import 'package:extra_tech/screens/auth/sign_up.dart';
import 'package:extra_tech/screens/dashboard/bottom_nav_bar.dart';
import 'package:extra_tech/screens/onboarding/onboarding_screen.dart';
import 'package:extra_tech/util/color.dart';
import 'package:extra_tech/util/components/main_button.dart';
import 'package:extra_tech/util/components/padded.dart';
import 'package:extra_tech/util/constant.dart';
import 'package:extra_tech/util/navigations.dart';
import 'package:extra_tech/util/validators.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:local_auth/local_auth.dart';

import 'forget_password.dart';

class SignInScreen extends StatefulHookConsumerWidget {
  const SignInScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  final formKey = GlobalKey<FormState>();
  late LongPressGestureRecognizer longPressRecognizer;
  final LocalAuthentication auth = LocalAuthentication();

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

  checkAuthentication() async {
    // ···
    final bool canAuthenticateWithBiometrics = await auth.canCheckBiometrics;
    final bool canAuthenticate =
        canAuthenticateWithBiometrics || await auth.isDeviceSupported();

    if (canAuthenticate) {
      try {
        final bool didAuthenticate = await auth.authenticate(
            localizedReason: 'Please authenticate to show account balance');
        if (didAuthenticate) {
          if (mounted) {
            RouteNavigators.routeNoWayHome(
              context,
              const BottomNavBar(),
            );
          }
        }
      } on PlatformException {
        // ...
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var userName = useTextEditingController(text: '');
    var password = useTextEditingController(text: '');
    void handlePress() {
      RouteNavigators.routeReplace(
        context,
        const SignUpScreen(
          businessType: BusinessType.unknown,
        ),
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Padded(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(autoAdjustHeight(95)),
                SvgPicture.asset('assets/svgs/logo.svg'),
                Gap(autoAdjustHeight(25)),
                Text(
                  'Hi, Welcome back',
                  style: kCustomTextStyle(
                    size: 34,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Gap(autoAdjustHeight(5)),
                Text(
                  'Sign in to your account.',
                  style: kCustomTextStyle(
                    size: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Gap(autoAdjustHeight(25)),
                ExtraTechTextFieldWidget(
                  userName: userName,
                  hintText: 'Email',
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
                    padding: EdgeInsets.all(
                      autoAdjustHeight(16.0),
                    ),
                    child: SvgPicture.asset(
                      'assets/svgs/eye-off-svgrepo-com1.svg',
                    ),
                  ),
                ),
                Gap(autoAdjustHeight(12)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        RouteNavigators.route(
                          context,
                          const ForgetPasswordScreen(),
                        );
                      },
                      child: Text(
                        'Forgot Password?',
                        textAlign: TextAlign.end,
                        style: kCustomTextStyle(
                          size: 14,
                          fontWeight: FontWeight.w700,
                          color: kSECCOLOUR,
                        ),
                      ),
                    ),
                  ],
                ),
                Gap(autoAdjustHeight(30)),
                ExtraTechMainButton(
                  text: 'Login',
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      RouteNavigators.routeNoWayHome(
                        context,
                        const BottomNavBar(),
                      );
                    }
                  },
                ),
                Gap(autoAdjustHeight(12)),
                Center(
                  child: Text.rich(
                    TextSpan(
                      text: 'Don’t have an account?',
                      style: kCustomTextStyle(
                          size: 12, fontWeight: FontWeight.w400),
                      children: [
                        TextSpan(
                          text: ' Sign Up',
                          style: kCustomTextStyle(
                              size: 13, fontWeight: FontWeight.w700),
                          recognizer: longPressRecognizer
                            ..onLongPress = handlePress,
                        ),
                      ],
                    ),
                  ),
                ),
                Gap(autoAdjustHeight(85)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: autoAdjustWidth(113),
                      child: Divider(
                        thickness: autoAdjustHeight(3),
                        color: kBLKCOLOUR,
                      ),
                    ),
                    Text(
                      'Or login with',
                      style: kCustomTextStyle(
                        size: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      width: autoAdjustWidth(113),
                      child: Divider(
                        thickness: autoAdjustHeight(3),
                        color: kBLKCOLOUR,
                      ),
                    ),
                  ],
                ),
                Gap(autoAdjustHeight(25)),
                GestureDetector(
                  onTap: () {
                    checkAuthentication();
                  },
                  child: Container(
                    height: autoAdjustHeight(50),
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                    child: Center(
                        child: Text(
                      'Login with Authentication',
                      style: kCustomTextStyle(
                        size: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ExtraTechTextFieldWidget extends StatelessWidget {
  const ExtraTechTextFieldWidget({
    super.key,
    required this.userName,
    required this.hintText,
    this.suffixIcon,
    this.validator,
  });

  final TextEditingController userName;
  final String hintText;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: userName,
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: suffixIcon,
      ),
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}
