import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tap_cash/constants/colors_manager.dart';
import 'package:tap_cash/constants/styles_manager.dart';

import '../utils/custom_number_input.dart';

class PasscodeScreen extends StatelessWidget {
  const PasscodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Hi, Amina',
              style: MyStyles.textStyle20.copyWith(
                color: MyColors.mainColor,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Enter passcode to unlock',
              style: MyStyles.textStyle16.copyWith(
                color: MyColors.grey,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const CustomNumbersInput(),
            SvgPicture.asset(
              'assets/icons/finger_print1.svg',
            )
          ],
        ),
      ),
    );
  }
}
