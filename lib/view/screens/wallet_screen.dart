import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/date_symbol_data_local.dart'; //for date locale
import 'package:intl/intl.dart';
import 'package:tap_cash/constants/colors.dart';
import 'package:tap_cash/constants/icons.dart';
import 'package:tap_cash/constants/styles.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  @override
  void initState() {
    initializeDateFormatting(); // Initial dateFormatter package before Run code.
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.mainColor,
      body: ListView(
        children: [
          Stack(
            children: [
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
                              onPressed: () {}, icon: Image.asset(MyIcons.eye))
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const Text(
                        'EGP 707,777',
                        style: MyStyles.textStyle36,
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
                      Row(
                        children: [
                          Text(DateTime.now().year.toString())
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
