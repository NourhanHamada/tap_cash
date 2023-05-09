import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constants/styles_manager.dart';
import 'custom_divider.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600.h,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ListView(
          children: [
            Text(
              'Select how to add money to your Tap Cash account',
              style: MyStyles.textStyle20.copyWith(
                fontWeight: FontWeight.normal,
              ),
            ),
            const CustomDivider(),
          ],
        ),
      ),
    );
  }
}
