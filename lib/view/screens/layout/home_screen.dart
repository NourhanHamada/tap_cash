import 'package:flutter/material.dart';
import 'package:tap_cash/constants/colors.dart';
import 'package:tap_cash/constants/icons.dart';
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
        padding: const EdgeInsets.all(24),
        child: ListView(
          children: [
            const HomeCustomAppBar(),
            const SizedBox(
              height: 10,
            ),
            const HomeUpperSection(),
            const SizedBox(
              height: 10,
            ),
            HomeGridView(),
            const SizedBox(
              height: 30,
            ),
            const HomeMiddleSectionCard(
              icon: MyIcons.wannaThank2,
              text: 'Wanna send thank!',
            ),
            const SizedBox(
              height: 30,
            ),
            const HomeLowerSection(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: MyColors.mainColor,
          ),
          borderRadius: BorderRadius.circular(
            100,
          ),
        ),
        backgroundColor: MyColors.white,
        child:  Padding(
          padding: const EdgeInsets.all(2.0),
          child:  Center(
            child: Image.asset(MyIcons.ask, width: 32,
            ),
          ),
        ),
      ),
    );
  }
}
