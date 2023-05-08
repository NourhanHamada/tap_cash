import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/date_symbol_data_local.dart'; //for date locale
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:tap_cash/constants/colors.dart';
import 'package:tap_cash/constants/icons.dart';
import 'package:tap_cash/constants/images.dart';
import 'package:tap_cash/constants/styles.dart';
import 'package:blur/blur.dart';

import '../widgets/wallet_screen/wallet_screen_lower_section.dart';
import '../widgets/wallet_screen/wallet_screen_upper_section.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: const [
           WalletScreenUpperSection(),
          WalletScreenLowerSection(),
        ],
      ),
    );
  }
}

