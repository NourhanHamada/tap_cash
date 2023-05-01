import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tap_cash/constants/colors.dart';
import 'package:tap_cash/constants/images.dart';
import 'package:tap_cash/constants/styles.dart';
import 'package:tap_cash/view/utils/custom_text_form_field.dart';

import '../../../controller/cubit/check_box_cubit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    // var checkBoxCubit = BlocProvider.of<CheckBoxCubit>(context, listen: true);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Welcome, Dear',
                  style: MyStyles.textStyle20,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(90.0),
                child: Image.asset(
                  MyImages.key,
                  width: 180.w,
                ),
              ),
             const CustomTextFormField(
                labelText: 'Email',
                obscureText: false,
                textInputType: TextInputType.emailAddress,
              ),
             SizedBox(
               height: 20.h,
             ),
             const CustomTextFormField(
                labelText: 'Password',
                obscureText: false,
                textInputType: TextInputType.visiblePassword,
              ),
              SizedBox(
                height: 15.h,
              ),
              Row(
                children: [
                  Row(
                    children: [
                      Checkbox(value: isChecked,
                          onChanged: (value){
                        isChecked = value!;
                        setState(() {
                          isChecked != isChecked;
                        });
                      },
                        materialTapTargetSize: MaterialTapTargetSize.padded,
                        visualDensity: VisualDensity.compact,
                      ),
                       Text('Remember me', style: MyStyles.textStyle14.copyWith(color: MyColors.grey),),
                    ],
                  ),

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
