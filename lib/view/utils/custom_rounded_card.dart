import 'package:flutter/material.dart';

import '../../constants/styles.dart';

class CustomRoundedCard extends StatelessWidget {
  const CustomRoundedCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.color,
    required this.fontWeight,
    required this.iconWidth,
  }) : super(key: key);

  final String icon;
  final String text;
  final Color color;
  final FontWeight fontWeight;
  final double iconWidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Card(
            color: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(200),
            ),
            elevation: 7,
            child: SizedBox(
              width: 80,
              height: 80,
              child: Center(
                child: Image.asset(
                  icon,
                  width: iconWidth,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 7,
          ),
          Center(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: MyStyles.textStyle16.copyWith(
                fontWeight: fontWeight,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
