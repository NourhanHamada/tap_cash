import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tap_cash/app_routes.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {

  var pageController = PageController();
  int currentIndex = 0;

  @override
  void initState() {
    _checkIfSeen();
    super.initState();
  }

  _checkIfSeen() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    bool seen = preferences.getBool('seen') ?? false ;
    if(seen){
      GoRouter.of(context).push(AppRouter.layout);
    }else {
      await preferences.setBool('seen', true);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Text('On Board')
        // Column(
        //   crossAxisAlignment: CrossAxisAlignment.center,
        //   children: [
        //     Container(
        //       child: PageView(
        //         controller: pageController,
        //         onPageChanged: (index){
        //           setState(() {
        //             currentIndex == index;
        //           });
        //         },
        //         children: const [
        //           Text('First Board'),
        //           Text('First Board'),
        //           Text('First Board'),
        //         ],
        //       ),
        //     )
        //   ],
        // ),
      ),
    );
  }
}
