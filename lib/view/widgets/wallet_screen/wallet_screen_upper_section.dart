import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/date_symbol_data_local.dart'; //for date locale
import 'package:intl/intl.dart';

import '../../../constants/colors.dart';
import '../../../constants/icons.dart';
import '../../../constants/images.dart';
import '../../../constants/styles.dart';

class WalletScreenUpperSection extends StatefulWidget {
  const WalletScreenUpperSection({Key? key}) : super(key: key);

  @override
  State<WalletScreenUpperSection> createState() => _WalletScreenUpperSectionState();
}

class _WalletScreenUpperSectionState extends State<WalletScreenUpperSection> {

  bool isBlur = false;
  late num totalBalance = 2000;

  @override
  void initState() {
    initializeDateFormatting(); // Initial dateFormatter package before Run code.
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          MyImages.background,
          fit: BoxFit.fitWidth,
          width: 600.h,
        ),
        Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    GoRouter.of(context).pop();
                  },
                  icon: Image.asset(
                    MyIcons.arrowBack1,
                    color: MyColors.white,
                    width: 16,
                  ),
                ),
                Text(
                  'Wallet',
                  style: MyStyles.textStyle20.copyWith(
                    color: MyColors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Total Balance',
                      style: MyStyles.textStyle20.copyWith(
                        fontWeight: FontWeight.bold,
                        color: MyColors.white,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          isBlur = !isBlur;
                        });
                      },
                      icon: Image.asset(
                        isBlur ? MyIcons.eyeClosed : MyIcons.eye,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  child: isBlur
                      ? Blur(
                    blur: 9.2,
                    blurColor: MyColors.mainColor.withOpacity(.5),
                    child: Text(
                      'EGP ${totalBalance.toString()}',
                      style: MyStyles.textStyle36,
                    ),
                  )
                      : Text(
                    'EGP ${totalBalance.toString()}',
                    style: MyStyles.textStyle36,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      DateFormat('d MMM yyyy').format(
                        DateTime.now(),
                      ),
                      style: MyStyles.textStyle16
                          .copyWith(color: MyColors.white),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Image.asset(
                      MyIcons.clock,
                      width: 16,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      DateFormat('h:mm a').format(
                        DateTime.now(),
                      ),
                      style: MyStyles.textStyle16
                          .copyWith(color: MyColors.white),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
