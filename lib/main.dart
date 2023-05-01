import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tap_cash/controller/database/web_services/dio_helper.dart';
import 'app_routes.dart';
import 'controller/database/local/shared_preferences_helper.dart';

void main() async{
  // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
  //   statusBarIconBrightness: Brightness.dark,
  //   statusBarColor: MyColors.mainColor,
  // ));
  // To Run ScreenUtilInit package.
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize DioHelper and CashHelper to run.
  await DioHelper.init();
  await SharedHelper.sharedInitialize();

  runApp(const TapCash());
}

class TapCash extends StatelessWidget {
  const TapCash({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 811),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
             ),
          routerConfig: AppRouter.router,
        );
      },
    );
  }
}
