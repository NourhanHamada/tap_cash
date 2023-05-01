import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:tap_cash/app_routes.dart';
import 'package:tap_cash/constants/colors.dart';
import 'package:tap_cash/constants/images.dart';
import 'package:tap_cash/constants/styles.dart';
import 'package:tap_cash/view/utils/custom_text_form_field.dart';
import 'package:tap_cash/view/utils/main_button.dart';

import '../../../controller/cubit/check_box_cubit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _firstnameController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _repeatpasswordController = TextEditingController();
  final _firstnameFocusNode = FocusNode();
  final _lastnameFocusNode = FocusNode();
  final _phoneFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _repeatpasswordFocusNode = FocusNode();
  bool isChecked = false;
  bool isPasswordVisible = true;
  bool isRepeatpasswordVisible = false;

  // @override
  // void dispose() {
  //   _emailController.dispose();
  //   _passwordController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    // var checkBoxCubit = BlocProvider.of<CheckBoxCubit>(context, listen: true);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
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
                  CustomTextFormField(
                    controller: _emailController,
                    focusNode: _emailFocusNode,
                    validator: (emailvalue) =>
                        emailvalue!.isEmpty ? 'Please Enter Your Email' : null,
                    onEditingComplete: () =>
                        FocusScope.of(context).requestFocus(_phoneFocusNode),
                    textInputAction: TextInputAction.next,
                    labelText: 'Email',
                    obscureText: false,
                    textInputType: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomTextFormField(
                    controller: _passwordController,
                    focusNode: _passwordFocusNode,
                    validator: (passwordvalue) => passwordvalue!.isEmpty
                        ? 'Please Enter Your Password'
                        : null,
                    onEditingComplete: () => FocusScope.of(context)
                        .requestFocus(_repeatpasswordFocusNode),
                    textInputAction: TextInputAction.next,
                    labelText: 'Password',
                    obscureText: false,
                    textInputType: TextInputType.visiblePassword,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: isChecked,
                            onChanged: (value) {
                              isChecked = value!;
                              setState(() {
                                isChecked != isChecked;
                              });
                            },
                            materialTapTargetSize: MaterialTapTargetSize.padded,
                            visualDensity: VisualDensity.compact,
                          ),
                          Text(
                            'Remember me',
                            style: MyStyles.textStyle14
                                .copyWith(color: MyColors.grey),
                          ),
                        ],
                      ),
                      /*
                      =========================================
                      = The Forget Your Password Button Starts
                      =========================================
                      */
                      InkWell(
                          onTap: () => GoRouter.of(context)
                              .pushReplacement(AppRouter.newPassword),
                          child: Text(
                            "Forget Your Password ?",
                            style: MyStyles.textStyle14.copyWith(
                                color: MyColors.mainColor,
                                fontWeight: FontWeight.bold),
                          )),
                      /*
                      ========================================
                      = The Forget Your Password Button Starts
                      ========================================
                      */
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  /*
                  ===========================
                  = The Login Button Starts
                  ===========================
                  */
                  MainButton(
                      text: "Login",
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // _submit(model);
                        }
                      }),
                  /*
                  ========================
                   = The Login Button Ends
                  ========================
                  */
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account, ',
                        style:
                            MyStyles.textStyle14.copyWith(color: MyColors.grey),
                      ),
                      InkWell(
                          onTap: () => GoRouter.of(context)
                              .pushReplacement(AppRouter.signupScreen),
                          child: Text(
                            "Sign Up ?",
                            style: MyStyles.textStyle14.copyWith(
                                color: MyColors.mainColor,
                                fontWeight: FontWeight.bold),
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
