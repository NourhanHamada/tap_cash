import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider(
      thickness: .5,
      color: MyColors.mainColor,
      indent: 3,
      endIndent: 3,
    );
  }
}
