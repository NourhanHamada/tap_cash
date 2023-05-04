import 'package:flutter/material.dart';
import 'package:tap_cash/constants/colors.dart';
import 'package:tap_cash/constants/icons.dart';
import 'package:tap_cash/view/utils/custom_rounded_card.dart';
import 'package:tap_cash/view/widgets/home_screen/home_grid_view.dart';
import '../../utils/home_middle_card.dart';
import '../../widgets/home_screen/Home_custom_app_bar.dart';
import '../../widgets/home_screen/home_lower_screen.dart';
import '../../widgets/home_screen/home_upper_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: const [
            HomeCustomAppBar(),
            SizedBox(
              height: 10,
            ),
            HomeUpperSection(),
            SizedBox(
              height: 10,
            ),
            HomeGridView(),
            SizedBox(
              height: 30,
            ),
            HomeMiddleSectionCard(
              icon: MyIcons.wannaThank2,
              text: 'Wanna send thank!',
            ),
            SizedBox(
              height: 30,
            ),
            HomeLowerSection(),
          ],
        ),
      ),
    );
  }
}