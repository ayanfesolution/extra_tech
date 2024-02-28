import 'package:auto_adjust/auto_adjust.dart';
import 'package:extra_tech/screens/products/write_reviews.dart';
import 'package:extra_tech/util/components/main_button.dart';
import 'package:extra_tech/util/components/padded.dart';
import 'package:extra_tech/util/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProfileScreenPage extends StatefulHookConsumerWidget {
  const ProfileScreenPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ProfileScreenPageState();
}

class _ProfileScreenPageState extends ConsumerState<ProfileScreenPage> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var fullName = useTextEditingController();
    var emailaddress = useTextEditingController();
    var phoneNumber = useTextEditingController();
    return Scaffold(
      appBar: AppBar(),
      body: Padded(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    'Profile',
                    textAlign: TextAlign.center,
                    style: kCustomTextStyle(
                      size: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Gap(autoAdjustHeight(10)),
                Text(
                  'Add a profile photo and name to blend in your vibes.',
                  textAlign: TextAlign.center,
                  style: kCustomTextStyle(
                    size: 13,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Gap(autoAdjustHeight(40)),
                SizedBox(
                  height: autoAdjustHeight(84),
                  width: autoAdjustWidth(84),
                  child: Stack(
                    children: [
                      CircleAvatar(
                        backgroundColor: const Color(0xFFC7C7C7),
                        maxRadius: autoAdjustHeight(43),
                        child: SvgPicture.asset('assets/svgs/layer1.svg'),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: SvgPicture.asset('assets/svgs/pluscircle.svg'),
                      )
                    ],
                  ),
                ),
                Gap(autoAdjustHeight(18)),
                ExtraTechDesignerTextField(
                  controller: fullName,
                  title: 'Full Name',
                  hint: 'Enter name',
                ),
                Gap(autoAdjustHeight(18)),
                ExtraTechDesignerTextField(
                  controller: emailaddress,
                  title: 'Email Address',
                  hint: 'Enter email',
                ),
                Gap(autoAdjustHeight(18)),
                ExtraTechDesignerTextField(
                  controller: phoneNumber,
                  title: 'Phone Number',
                  hint: 'Enter number',
                ),
                Gap(autoAdjustHeight(30)),
                ExtraTechMainButton(
                  text: 'Update Profile',
                  cornerRadius: autoAdjustHeight(20),
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
