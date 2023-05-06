import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tap_cash/app_routes.dart';
import 'package:tap_cash/constants/icons.dart';
import 'package:tap_cash/constants/images.dart';
import 'package:tap_cash/constants/strings.dart';
import 'package:tap_cash/constants/styles.dart';
import 'package:tap_cash/view/utils/main_button.dart';

import '../../constants/colors.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  var pageController = PageController();
  int currentIndex = 0;
  List<String> titles = [
    'Smart wallet',
    'Smart Card',
    'Child\'s money management',
    'House\'s money management',
    'Debts',
    'Donation & Helps',
  ];
  List<String> text = [
    MyStrings.onboard1,
    MyStrings.onboard2,
    MyStrings.onboard3,
    MyStrings.onboard4,
    MyStrings.onboard5,
    MyStrings.onboard6,
  ];
  List<String> images = [
    MyImages.wallet,
    MyImages.smartCard,
    MyImages.adultWithBaby,
    MyImages.money,
    MyImages.debts,
    MyImages.sendMoney
  ];

  @override
  void initState() {
    // _checkIfSeen();
    super.initState();
  }

  _checkIfSeen() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    bool seen = preferences.getBool('seen') ?? false;
    if (seen) {
      GoRouter.of(context).push(AppRouter.layout);
    } else {
      await preferences.setBool('seen', true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 600.h,
                  child: PageView.builder(
                    itemCount: text.length,
                    controller: pageController,
                    onPageChanged: (index) {
                      setState(() {
                        currentIndex == index;
                      });
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              index == 0
                                  ? Text(
                                      'Let\'s go',
                                      style: MyStyles.textStyle20.copyWith(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )
                                  : Image.asset(
                                      MyIcons.arrowBack,
                                      width: 24,
                                    ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    MyIcons.logo2,
                                    width: 46,
                                  ),
                                  Text(
                                    'Tap Cash',
                                    style: MyStyles.textStyle12.copyWith(
                                        color: MyColors.mainColor,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 80.h,
                          ),
                          Image.asset(
                            images[index],
                            height: 232.h,
                            width: 260,
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Text(
                            titles[index],
                            style: MyStyles.textStyle20.copyWith(
                              fontWeight: FontWeight.w600,
                              color: MyColors.mainColor,
                            ),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          SizedBox(
                            width: 315.w,
                            child: Text(
                              text[index],
                              textAlign: TextAlign.center,
                              style: MyStyles.textStyle16.copyWith(
                                color: MyColors.mainColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 32.h,
                ),
                SmoothPageIndicator(
                  controller: pageController,
                  count: text.length,
                  effect: WormEffect(
                    activeDotColor: MyColors.green,
                    dotColor: MyColors.lightGrey,
                    dotHeight: 16.0.w,
                    dotWidth: 16.0.h,
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                MainButton(
                  text: 'Next',
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// To Do - -> Don't forget to call a _checkIfSeen function !!!!
