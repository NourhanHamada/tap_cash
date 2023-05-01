import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tap_cash/app_routes.dart';
import 'package:tap_cash/constants/colors.dart';
import 'package:tap_cash/constants/icons.dart';
import 'package:tap_cash/constants/strings.dart';
import 'package:tap_cash/constants/styles.dart';

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              MyIcons.logo,
            ),
             Text(
              MyStrings.appName,
              style: GoogleFonts.skranji(textStyle: MyStyles.textStyle40),
            ),
          ],
        ),
      ),
    );
  }

  // Function to navigate to Home after 2 seconds.
  void navigateToHome(){
    Future.delayed(
        const Duration(seconds: 2),
            (){
          GoRouter.of(context).push(AppRouter.loginScreen);
        }
    );
  }
}