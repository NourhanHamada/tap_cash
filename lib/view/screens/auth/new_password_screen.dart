import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:tap_cash/app_routes.dart';
import 'package:tap_cash/constants/colors.dart';
import 'package:tap_cash/constants/images.dart';
import 'package:tap_cash/constants/styles.dart';
import 'package:tap_cash/view/utils/custom_text_form_field.dart';
import 'package:tap_cash/view/utils/main_button.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({super.key});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _repeatpasswordController = TextEditingController();

  final _passwordFocusNode = FocusNode();
  final _repeatpasswordFocusNode = FocusNode();
  bool isPasswordVisible = true;
  bool isRepeatpasswordVisible = false;

  String? passwordValue;
  String? repeatpasswordValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /*
                  =========================================
                  = NewPassword Screen Header Start
                  =========================================
                  */
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                          onPressed: () {
                            GoRouter.of(context)
                                .pushReplacement(AppRouter.loginScreen);
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            size: 25,
                            color: MyColors.blue,
                          )),
                      Text(
                        'New Password',
                        style: MyStyles.textStyle20
                            .copyWith(color: MyColors.mainColor),
                      ),
                    ],
                  ),
                  /*
                  =========================================
                  = NewPassword Screen Header Start
                  =========================================
                  */
                  SizedBox(
                    height: 15.h,
                  ),
                  /*
                  =========================================
                  = NewPassword Screen Image Start
                  =========================================
                  */
                  Padding(
                    padding: const EdgeInsets.all(90.0),
                    child: Image.asset(
                      MyImages.key,
                      width: 180.w,
                    ),
                  ),
                  /*
                  =========================================
                  = NewPassword Screen Image End
                  =========================================
                  */
                  /*
                  =========================================
                  = Password Start
                  =========================================
                  */
                  CustomTextFormField(
                    controller: _passwordController,
                    focusNode: _passwordFocusNode,
                    validator: (passwordval) {
                      passwordValue = passwordval;
                      if (passwordval!.isEmpty ||
                          !RegExp(r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$")
                              .hasMatch(passwordval)) {
                        return 'Enter correct password';
                      } else {
                        return null;
                      }
                    },
                    onEditingComplete: () => FocusScope.of(context)
                        .requestFocus(_repeatpasswordFocusNode),
                    textInputAction: TextInputAction.next,
                    labelText: 'Password',
                    obscureText: isPasswordVisible ? false : true,
                    textInputType: TextInputType.emailAddress,
                    suffixIcon: IconButton(
                      icon: isPasswordVisible
                          ? const Icon(Icons.visibility)
                          : const Icon(Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                    ),
                  ),
                  /*
                  =========================================
                  = Password End
                  =========================================
                  */
                  SizedBox(
                    height: 20.h,
                  ),
                  /*
                  =========================================
                  = Repeat Password Start
                  =========================================
                  */
                  CustomTextFormField(
                    controller: _repeatpasswordController,
                    focusNode: _repeatpasswordFocusNode,
                    textInputAction: TextInputAction.done,
                    validator: (repeatpasswordval) {
                      repeatpasswordValue = repeatpasswordval;
                      if (repeatpasswordval!.isEmpty) {
                        return 'Please Enter Your Repeat Password';
                      } else if (passwordValue != repeatpasswordValue) {
                        return 'Password not match';
                      } else {
                        return null;
                      }
                    },
                    labelText: 'Repeat Password',
                    obscureText: isRepeatpasswordVisible ? false : true,
                    textInputType: TextInputType.emailAddress,
                    suffixIcon: IconButton(
                      icon: isRepeatpasswordVisible
                          ? const Icon(Icons.visibility)
                          : const Icon(Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          isRepeatpasswordVisible = !isRepeatpasswordVisible;
                        });
                      },
                    ),
                  ),
                  /*
                  =========================================
                  = Repeat Password End
                  =========================================
                  */
                  SizedBox(
                    height: 30.h,
                  ),

                  /*
                  ==========================
                  = The Login Button Starts
                  ===========================
                  */
                  MainButton(
                      text: "Done",
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          GoRouter.of(context)
                              .pushReplacement(AppRouter.loginScreen);
                        }
                      }),
                  /*
                  ========================
                  = The Login Button Ends
                  ========================
                  */
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
