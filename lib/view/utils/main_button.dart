// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:tap_cash/constants/colors.dart';

class MainButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const MainButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      height: 50.0,
      decoration: BoxDecoration(
          color: MyColors.mainColor, borderRadius: BorderRadius.circular(23)),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}