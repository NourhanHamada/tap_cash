import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/icons.dart';
import '../../utils/custom_rounded_card.dart';

class HomeUpperSection extends StatelessWidget {
  const HomeUpperSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        CustomRoundedCard(
          icon: MyIcons.add,
          text: 'Add Money',
          color: MyColors.mentGreen,
          fontWeight: FontWeight.w600,
          iconWidth: 32,
        ),
        CustomRoundedCard(
          icon: MyIcons.arrow,
          text: 'Send money',
          color: MyColors.mentGreen,
          fontWeight: FontWeight.w600,
          iconWidth: 32,
        ),
      ],
    );
  }
}
