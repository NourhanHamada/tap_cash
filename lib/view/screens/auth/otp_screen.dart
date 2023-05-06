import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:tap_cash/app_routes.dart';
import 'package:tap_cash/constants/colors.dart';
import 'package:tap_cash/constants/images.dart';
import 'package:tap_cash/constants/styles.dart';
import 'package:tap_cash/view/utils/main_button.dart';

import '../../utils/custom_text_field.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final _formKey = GlobalKey<FormState>();
  final _oneController = TextEditingController();
  final _twoController = TextEditingController();
  final _threeController = TextEditingController();
  final _fourController = TextEditingController();
  final _fiveController = TextEditingController();
  final _oneFocusNode = FocusNode();
  final _twoFocusNode = FocusNode();
  final _threeFocusNode = FocusNode();
  final _fourFocusNode = FocusNode();
  final _fiveFocusNode = FocusNode();

  String? userEmail = " najwaA99@gmail.com";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  /*
                  =========================================
                  = OTP Screen  Header Start
                  =========================================
                  */
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                          onPressed: () {
                            GoRouter.of(context)
                                .pushReplacement(AppRouter.signupScreen);
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            size: 25,
                            color: MyColors.blue,
                          )),
                      Text(
                        'Enter OTP',
                        style: MyStyles.textStyle20
                            .copyWith(color: MyColors.mainColor),
                      ),
                    ],
                  ),
                  /*
                  =========================================
                  = OTP Screen Header Start
                  =========================================
                  */
                  SizedBox(
                    height: 30.h,
                  ),
                  /*
                  =========================================
                  = Verification Screen Image Start
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
                  = Verification Screen Image End
                  =========================================
                  */
                  Text(
                    'Please enter 5- digit OTP sent to your Email $userEmail',
                    style: MyStyles.textStyle20
                        .copyWith(color: MyColors.mainColor),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),

                  /*
                  =========================================
                  = OTP Digits Start
                  =========================================
                  */
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomTextField(
                        controller: _oneController,
                      focusNode: _oneFocusNode,
                        validator: (oneValue){
                          oneValue!.isEmpty ? 'Enter First Digit' : null;
                        },
                      ),
                      CustomTextField(
                        controller: _twoController,
                      focusNode: _twoFocusNode,
                        validator: (twoValue){
                          twoValue!.isEmpty ? 'Enter Second Digit' : null;
                        },
                      ),
                      CustomTextField(
                        controller: _threeController,
                        focusNode: _threeFocusNode,
                        validator: (threeValue){
                          threeValue!.isEmpty ? 'Enter Third Digit' : null;
                        },
                      ),
                      CustomTextField(
                        controller: _fourController,
                        focusNode: _fourFocusNode,
                        validator: (fourValue){
                          fourValue!.isEmpty ? 'Enter Fourth Digit' : null;
                        },
                      ),
                      CustomTextField(
                        controller: _fiveController,
                        focusNode: _fiveFocusNode,
                        validator: (fiveValue){
                          fiveValue!.isEmpty ? 'Enter Fifth Digit' : null;
                        },
                      ),

                    ],
                  ),

                  /*
                  =========================================
                  = OTP Digits End
                  =========================================
                  */
                  SizedBox(
                    height: 20.h,
                  ),

                  /*
                  ==========================
                  = The Login Button Starts
                  ===========================
                  */
                  MainButton(
                      text: "Send",
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
