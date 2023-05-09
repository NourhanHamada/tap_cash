import 'package:flutter/material.dart';
import '../../../constants/colors.dart';
import '../../../constants/icons.dart';
import '../../utils/custom_bottom_sheet.dart';
import '../../utils/custom_rounded_card.dart';

class HomeUpperSection extends StatelessWidget {
  const HomeUpperSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                ),
                builder: (context) {
                  return Wrap(
                    children: const [
                      CustomBottomSheet(),
                    ],
                  );
                });
          },
          child: const CustomRoundedCard(
            icon: MyIcons.add,
            text: 'Add Money',
            color: MyColors.mentGreen,
            fontWeight: FontWeight.w600,
            iconWidth: 32,
          ),
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

