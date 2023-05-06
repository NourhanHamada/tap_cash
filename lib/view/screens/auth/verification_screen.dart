import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:tap_cash/app_routes.dart';
import 'package:tap_cash/constants/colors.dart';
import 'package:tap_cash/constants/images.dart';
import 'package:tap_cash/constants/styles.dart';
import 'package:tap_cash/providers/auth_provider.dart';
import 'package:tap_cash/view/utils/custom_text_form_field.dart';
import 'package:tap_cash/view/utils/main_button.dart';
import 'package:provider/provider.dart';
import 'package:another_flushbar/flushbar.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _emailFocusNode = FocusNode();
  String? email;

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);
    void register() {
      final form = _formKey.currentState;
      if (form!.validate()) {
        form.save();
        auth.verification(email).then((respose) {
          if (respose['status']) {
            GoRouter.of(context).pushReplacement(AppRouter.otpScreen);
          } else {
            Flushbar(
                    title: "Registered Failed",
                    message: respose.toString(),
                    duration: const Duration(seconds: 100))
                .show(context);
          }
        });
      } else {
        Flushbar(
                title: "Invalid Form",
                message: 'please complete the form properly',
                duration: const Duration(seconds: 100))
            .show(context);
      }
    }

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
                  /*
                  =========================================
                  = Verification Screen Header Start
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
                        'Verification',
                        style: MyStyles.textStyle20
                            .copyWith(color: MyColors.mainColor),
                      ),
                    ],
                  ),
                  /*
                  =========================================
                  = Verification Screen Header Start
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
                    'We Will Send You a Verification code to your E-mail',
                    style: MyStyles.textStyle20
                        .copyWith(color: MyColors.mainColor),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),

                  /*
                  =========================================
                  = Email Start
                  =========================================
                  */
                  CustomTextFormField(
                    controller: _emailController,
                    focusNode: _emailFocusNode,
                    validator: (emailvalue) {
                      if (emailvalue!.isEmpty ||
                          !RegExp(r'^[\w-\.]+@([\w-]+\.)+\w{2,4}')
                              .hasMatch(emailvalue)) {
                        return 'Enter correct Email';
                      } else {
                        return null;
                      }
                    },
                    onSaved: (emailValue) {
                      email = emailValue;
                    },
                    textInputAction: TextInputAction.done,
                    labelText: 'Email',
                    obscureText: false,
                    textInputType: TextInputType.emailAddress,
                  ),
                  /*
                  =========================================
                  = Email End
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
                              .pushReplacement(AppRouter.otpScreen);
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
