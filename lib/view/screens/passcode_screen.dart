import 'package:flutter/material.dart';
import 'package:tap_cash/view/utils/custom_circles_passcode.dart';
import '../../constants/colors_manager.dart';
import '../../constants/styles_manager.dart';
import '../utils/custom_number_input.dart';

class PasscodeScreen extends StatelessWidget {
  const PasscodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Hi, Amina',
              style: MyStyles.textStyle20.copyWith(
                color: MyColors.mainColor,
              ),
            ),
            Text(
              'Enter passcode to unlock',
              style: MyStyles.textStyle16.copyWith(
                color: MyColors.grey,
              ),
            ),
            // SizedBox(
            //   height: 50,
            //   width: double.infinity,
            //   child: Center(
            //     child: ListView.builder(
            //       scrollDirection: Axis.horizontal,
            //       shrinkWrap: true,
            //       itemCount: 5,
            //       itemBuilder: (BuildContext context, int index) {
            //         return Padding(
            //           padding: const EdgeInsets.all(5.0),
            //           child: Container(
            //             height: 25,
            //             width: 25,
            //             decoration: const BoxDecoration(
            //               shape: BoxShape.circle,
            //               color: Color(0xFFEAEEF1),
            //             ),
            //           ),
            //         );
            //       },
            //     ),
            //   ),
            // ),
            const CustomNumbersInput(),
          ],
        ),
      ),
    );
  }
}
