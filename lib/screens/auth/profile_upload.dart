import 'package:auto_adjust/auto_adjust.dart';
import 'package:extra_tech/screens/auth/reg_complete.dart';
import 'package:extra_tech/screens/auth/sign_in.dart';
import 'package:extra_tech/util/components/padded.dart';
import 'package:extra_tech/util/navigations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../util/components/main_button.dart';
import '../../util/constant.dart';
import '../../util/validators.dart';

class ProfileUploadScreen extends StatefulHookConsumerWidget {
  const ProfileUploadScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ProfileUploadScreenState();
}

class _ProfileUploadScreenState extends ConsumerState<ProfileUploadScreen> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var firstName = useTextEditingController();
    var lastName = useTextEditingController(text: '');
    var address = useTextEditingController(text: '');
    var phoneNumber = useTextEditingController(text: '');
    var isAgreedNow = useState(false);
    return Scaffold(
      body: Padded(
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
                'Profile Update',
                style: kCustomTextStyle(
                  size: 34,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Gap(autoAdjustHeight(5)),
              Text(
                'Complete your profile',
                style: kCustomTextStyle(
                  size: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Gap(autoAdjustHeight(25)),
              ExtraTechTextFieldWidget(
                userName: lastName,
                hintText: 'Last Name',
                validator: (p0) =>
                    Validators.validateText(p0 ?? '', 'Last Name'),
                suffixIcon: Padding(
                  padding: EdgeInsets.all(autoAdjustHeight(16.0)),
                  child: SvgPicture.asset(
                      'assets/svgs/edit-2-svgrepo-com(1)1.svg'),
                ),
              ),
              Gap(autoAdjustHeight(25)),
              ExtraTechTextFieldWidget(
                userName: firstName,
                hintText: 'First Name',
                validator: (p0) =>
                    Validators.validateText(p0 ?? '', 'First Name'),
                suffixIcon: Padding(
                  padding: EdgeInsets.all(autoAdjustHeight(16.0)),
                  child: SvgPicture.asset(
                      'assets/svgs/edit-2-svgrepo-com(1)1.svg'),
                ),
              ),
              Gap(autoAdjustHeight(25)),
              ExtraTechTextFieldWidget(
                userName: address,
                hintText: 'Address',
                validator: (p0) => Validators.validateText(p0 ?? '', 'Address'),
                suffixIcon: Padding(
                  padding: EdgeInsets.all(autoAdjustHeight(16.0)),
                  child: SvgPicture.asset(
                      'assets/svgs/edit-2-svgrepo-com(1)1.svg'),
                ),
              ),
              Gap(autoAdjustHeight(35)),
              Row(
                children: [
                  Checkbox(
                    value: isAgreedNow.value,
                    onChanged: (value) {
                      isAgreedNow.value = value ?? false;
                    },
                  ),
                  Text(
                    'I have read the user agreement and i accept it.',
                    style: kCustomTextStyle(
                      size: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
              Gap(autoAdjustHeight(35)),
              ExtraTechMainButton(
                text: 'Continue',
                onTap: () {
                  if (formKey.currentState!.validate() && isAgreedNow.value) {
                    RouteNavigators.route(
                      context,
                      const RegistrationCompletedScreen(),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
