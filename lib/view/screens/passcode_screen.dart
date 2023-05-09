import 'package:flutter/material.dart';
import '../../constants/colors_manager.dart';
import '../../constants/styles_manager.dart';
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
           const CustomNumbersInput(),
          ],
        ),
      ),
    );
  }
}
