import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants/styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
      required this.controller,
      required this.focusNode,
      this.validator})
      : super(key: key);

  final TextEditingController controller;
  final FocusNode focusNode;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 46,
      height: 52,
      child: TextFormField(
        validator: validator,
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
        onSaved: (val) {
          print(val);
        },
        controller: controller,
        focusNode: focusNode,
        style: MyStyles.textStyle20,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.name,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            hintText: '0'),
      ),
    );
  }
}