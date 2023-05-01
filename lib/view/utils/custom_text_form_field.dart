import 'package:flutter/material.dart';
import 'package:tap_cash/constants/colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    required this.labelText,
    required this.textInputType,
    required this.obscureText,
  }) : super(key: key);

  final String labelText;
  final TextInputType textInputType;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      obscureText: obscureText,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: const BorderSide(
              width: 2,
              color: MyColors.babyBlue
          ),
          borderRadius: BorderRadius.circular(23),
        ),
        // labelText: labelText,
        label: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(labelText),
        )
      ),
    );
  }
}
