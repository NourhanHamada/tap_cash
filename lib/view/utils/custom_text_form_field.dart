import 'package:flutter/material.dart';
import 'package:tap_cash/constants/colors.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      {Key? key,
      this.suffixIcon,
      this.onEditingComplete,
      this.border,
      required this.textInputAction,
      required this.validator,
      required this.focusNode,
      required this.labelText,
      required this.textInputType,
      required this.obscureText,
      required this.controller})
      : super(key: key);

  final String labelText;
  final TextInputType textInputType;
  final bool obscureText;
  final TextEditingController controller;
  FocusNode focusNode;
  Widget? suffixIcon;
  void Function()? onEditingComplete;
  String? Function(String?)? validator;
  TextInputAction? textInputAction;
  InputBorder? border;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      focusNode: focusNode,
      onEditingComplete: onEditingComplete,
      textInputAction: textInputAction,
      keyboardType: textInputType,
      obscureText: obscureText,
      decoration: InputDecoration(
          suffixIcon: suffixIcon,
          border: border ??
              OutlineInputBorder(
                borderSide:
                    const BorderSide(width: 2, color: MyColors.babyBlue),
                borderRadius: BorderRadius.circular(23),
              ),
          // labelText: labelText,
          label: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(labelText),
          )),
    );
  }
}
