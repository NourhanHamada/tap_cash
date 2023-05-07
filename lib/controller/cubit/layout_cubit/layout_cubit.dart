import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tap_cash/constants/icons.dart';
import 'package:tap_cash/models/user_models.dart';
import 'package:tap_cash/view/screens/layout/history_screen.dart';
import 'package:tap_cash/view/screens/layout/transfer_screen.dart';
import 'package:tap_cash/view/screens/layout/user_screen.dart';
import '../../../view/screens/layout/home_screen.dart';

part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());

  static LayoutCubit get(context) => BlocProvider.of(context);

  var currentIndex = 0;
  List<String> titles = [];

  List<Widget> screensMethod(User userInfo){
    return [
      HomeScreen(userInfo),
      TransferScreen(),
      HistoryScreen(),
      UserScreen(),
    ];
  }



  List<BottomNavigationBarItem> bottomNavBarItems = [
    BottomNavigationBarItem(
      icon: Image.asset(
        MyIcons.bank,
        width: 24,
        height: 24,
      ),
      label: 'Home',
      activeIcon: Image.asset(
        MyIcons.bankFilled,
        width: 24,
      ),
    ),
    BottomNavigationBarItem(
      icon: Image.asset(
        MyIcons.transfer,
        width: 24,
        height: 24,
      ),
      label: 'Transfer',
      activeIcon: Image.asset(
        MyIcons.transferFilled,
        width: 24,
      ),
    ),
    BottomNavigationBarItem(
      icon: Image.asset(
        MyIcons.history,
        width: 24,
        height: 24,
      ),
      label: 'Transactions',
      activeIcon: Image.asset(
        MyIcons.historyFilled,
        width: 24,
      ),
    ),
    BottomNavigationBarItem(
      icon: Image.asset(
        MyIcons.user,
        width: 24,
        height: 24,
      ),
      label: 'Me',
      activeIcon: Image.asset(
        MyIcons.userFilled,
        width: 24,
      ),
    ),
  ];

  void changeIndex(index) {
    currentIndex = index;
    emit(ChangeBottomNavBarState());
  }
}
