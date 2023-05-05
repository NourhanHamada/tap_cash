import 'package:flutter/material.dart';
import 'package:tap_cash/constants/colors.dart';

import '../../../constants/icons.dart';
import '../../utils/custom_rounded_card.dart';

class HomeGridView extends StatelessWidget {
  HomeGridView({Key? key}) : super(key: key);

  final List<String> texts = [
    'Wallet',
    'Card',
    'Child\'s money',
    'House\'s money',
    'Debts',
    'Donation & Helps',
  ];
  final List<String> icons = [
    MyIcons.wallet,
    MyIcons.card,
    MyIcons.childsMoney,
    MyIcons.housesMoney,
    MyIcons.debts,
    MyIcons.donation,
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 120,
          child: ListView.builder(
            // padding: const EdgeInsets.all(0),
            physics: const AlwaysScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: icons.length,
            itemBuilder: (BuildContext context, int index) {
              return CustomRoundedCard(
                icon: icons[index],
                text: texts[index],
                color: MyColors.white,
                fontWeight: FontWeight.w500,
                iconWidth: 40,
              );
            },
          ),
        ),
      ],
    );
  }
}
