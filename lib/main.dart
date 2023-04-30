import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_routes.dart';
import 'constants/colors.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: MyColors.mainColor,
      )
  );
  // To Run ScreenUtilInit package.
  WidgetsFlutterBinding.ensureInitialized();
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
      builder: (BuildContext context, Widget? child){
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
