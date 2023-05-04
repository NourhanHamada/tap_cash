import 'package:flutter/material.dart';
import 'package:tap_cash/constants/colors.dart';

import '../../../constants/icons.dart';
import '../../utils/custom_rounded_card.dart';

class HomeGridView extends StatelessWidget {
  const HomeGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView(
        padding: const EdgeInsets.all(0),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: const [
          CustomRoundedCard(
            icon: MyIcons.wallet,
            text: 'Wallet',
            color: MyColors.white,
            fontWeight: FontWeight.w500,
            iconWidth: 40,
          ),
          CustomRoundedCard(
            icon: MyIcons.card,
            text: 'Card',
            color: MyColors.white,
            fontWeight: FontWeight.w500,
            iconWidth: 40,
          ),
          CustomRoundedCard(
            icon: MyIcons.childsMoney,
            text: 'Child\'s money',
            color: MyColors.white,
            fontWeight: FontWeight.w500,
            iconWidth: 40,
          ),
          CustomRoundedCard(
            icon: MyIcons.housesMoney,
            text: 'House\'s money',
            color: MyColors.white,
            fontWeight: FontWeight.w500,
            iconWidth: 40,
          ),
          CustomRoundedCard(
            icon: MyIcons.debts,
            text: 'Debts',
            color: MyColors.white,
            fontWeight: FontWeight.w500,
            iconWidth: 40,
          ),
          CustomRoundedCard(
            icon: MyIcons.donation,
            text: 'Donation & Helps',
            color: MyColors.white,
            fontWeight: FontWeight.w500,
            iconWidth: 40,
          ),
        ],
      ),
    );
  }
}
