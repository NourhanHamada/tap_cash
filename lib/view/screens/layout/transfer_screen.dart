import 'package:blur/blur.dart';
import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/icons.dart';
import '../../../constants/styles.dart';

class TransferScreen extends StatefulWidget {
  const TransferScreen({Key? key}) : super(key: key);

  @override
  State<TransferScreen> createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {

  bool isBlur = false;
  late num totalBalance = 2000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.green,
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    child: isBlur
                        ? Blur(
                      blur: 9.2,
                      blurColor: MyColors.mainColor.withOpacity(.7),
                      child: Text(
                        'EGP ${totalBalance.toString()}',
                        style: MyStyles.textStyle36,
                      ),
                    )
                        : Text(
                      'EGP ${totalBalance.toString()}',
                      style: MyStyles.textStyle36.copyWith(color: MyColors.mainColor),
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
                      color: MyColors.mainColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 9,
              ),
              Text('Current balance', style: MyStyles.textStyle14.copyWith(color: MyColors.mainColor),)
            ],
          ),
        ),
      ),
    );
  }
}
