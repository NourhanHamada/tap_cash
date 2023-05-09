import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tap_cash/app_routes.dart';
import 'package:tap_cash/constants/colors.dart';
import 'package:tap_cash/constants/icons.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateToHome();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.mainColor,
      body: Center(
        child: Image.asset(
          MyIcons.logo2,
        ),
      ),
    );
  }

  // Function to navigate to Home after 2 seconds.
  void navigateToHome() {
    Future.delayed(const Duration(seconds: 2), () {
      GoRouter.of(context).push(AppRouter.layout);
    });
  }
}
