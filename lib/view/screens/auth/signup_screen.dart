import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:tap_cash/app_routes.dart';
import 'package:tap_cash/constants/colors_manager.dart';
import 'package:tap_cash/constants/styles_manager.dart';
import 'package:tap_cash/models/user_models.dart';
import 'package:tap_cash/providers/auth_provider.dart';
import 'package:tap_cash/view/utils/custom_text_form_field.dart';
import 'package:tap_cash/view/utils/main_button.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _firstnameController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _repeatPasswordController = TextEditingController();
  final _firstnameFocusNode = FocusNode();
  final _lastnameFocusNode = FocusNode();
  final _phoneFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _repeatPasswordFocusNode = FocusNode();
  bool isChecked = false;
  bool isPasswordVisible = false;
  bool isRepeatPasswordVisible = false;
  String? name;
  String? email;
  String? password;
  String? passwordValue;
  String? repeatPasswordValue;

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);
    void register() {
      final form = _formKey.currentState;
      if (form!.validate() && isChecked == true) {
        form.save();
        auth.register(name, email, password).then((response) {
          if (response['status']) {
            User user = response['data'];
            auth.setRegisterStatus(Status.registered);
            auth.verification(user.email).then((response) {
              if (response['status']) {
                User user = response['data'];
                GoRouter.of(context).pushReplacement(AppRouter.otpScreen);
              } else {
                Flushbar(
                        title: "Registered Failed",
                        message: response.toString(),
                        duration: const Duration(seconds: 100))
                    .show(context);
              }
            });
          } else {
            Flushbar(
                    title: "Registered Failed",
                    message: response.toString(),
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
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /*
                      =========================================
                      = Sign up Screen Header Start
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
                        'Sign up',
                        style: MyStyles.textStyle20
                            .copyWith(color: MyColors.mainColor),
                      ),
                    ],
                  ),
                  /*
                      =========================================
                      = Sign up Screen Header Start
                      =========================================
                      */
                  SizedBox(
                    height: 30.h,
                  ),
                  /*
                      =========================================
                      = First name Start
                      =========================================
                      */
                  CustomTextFormField(
                    controller: _firstnameController,
                    focusNode: _firstnameFocusNode,
                    validator: (firstNameValue) => firstNameValue!.isEmpty
                        ? 'Please Enter Your First name'
                        : null,
                    onSaved: (namevalue) {
                      name = namevalue;
                    },
                    onEditingComplete: () =>
                        FocusScope.of(context).requestFocus(_lastnameFocusNode),
                    textInputAction: TextInputAction.next,
                    labelText: 'First name',
                    obscureText: false,
                    textInputType: TextInputType.text,
                  ),
                  /*
                      =========================================
                      = First name End
                      =========================================
                      */
                  SizedBox(
                    height: 20.h,
                  ),
                  /*
                      =========================================
                      = Last name Start
                      =========================================
                      */
                  CustomTextFormField(
                    controller: _lastnameController,
                    focusNode: _lastnameFocusNode,
                    validator: (lastNameValue) => lastNameValue!.isEmpty
                        ? 'Please Enter Your Last name'
                        : null,
                    onEditingComplete: () =>
                        FocusScope.of(context).requestFocus(_emailFocusNode),
                    textInputAction: TextInputAction.next,
                    labelText: 'Last name',
                    obscureText: false,
                    textInputType: TextInputType.text,
                  ),
                  /*
                      =========================================
                      = Last name End
                      =========================================
                      */
                  SizedBox(
                    height: 20.h,
                  ),
                  /*
                      =========================================
                      = Email Start
                      =========================================
                      */
                  CustomTextFormField(
                    controller: _emailController,
                    focusNode: _emailFocusNode,
                    validator: (emailValue) {
                      if (emailValue!.isEmpty) {
                        return 'Enter correct Email';
                      } else {
                        return null;
                      }
                    },
                    onSaved: (emailValue) {
                      email = emailValue;
                    },
                    onEditingComplete: () =>
                        FocusScope.of(context).requestFocus(_phoneFocusNode),
                    textInputAction: TextInputAction.next,
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
                      =========================================
                      = Phone Start
                      =========================================
                      */
                  CustomTextFormField(
                    controller: _phoneController,
                    focusNode: _phoneFocusNode,
                    validator: (phoneValue) =>
                        phoneValue!.isEmpty ? 'Please Enter Your Phone' : null,
                    onEditingComplete: () =>
                        FocusScope.of(context).requestFocus(_passwordFocusNode),
                    textInputAction: TextInputAction.next,
                    labelText: 'Phone',
                    obscureText: false,
                    textInputType: TextInputType.phone,
                  ),
                  /*
                      =========================================
                      = Phone End
                      =========================================
                      */
                  SizedBox(
                    height: 20.h,
                  ),
                  /*
                      =========================================
                      = Password Start
                      =========================================
                      */
                  CustomTextFormField(
                    controller: _passwordController,
                    focusNode: _passwordFocusNode,
                    validator: (passwordVal) {
                      passwordValue = passwordVal;
                      if (passwordVal!.isEmpty) {
                        return 'Enter correct password';
                      } else {
                        return null;
                      }
                    },
                    onEditingComplete: () => FocusScope.of(context)
                        .requestFocus(_repeatPasswordFocusNode),
                    textInputAction: TextInputAction.next,
                    labelText: 'Password',
                    obscureText: isPasswordVisible ? false : true,
                    textInputType: TextInputType.visiblePassword,
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
                    controller: _repeatPasswordController,
                    focusNode: _repeatPasswordFocusNode,
                    textInputAction: TextInputAction.done,
                    validator: (repeatPasswordVal) {
                      repeatPasswordValue = repeatPasswordVal;
                      if (repeatPasswordVal!.isEmpty) {
                        return 'Please Enter Your Repeat Password';
                      } else if (passwordValue != repeatPasswordValue) {
                        return 'Password not match';
                      } else {
                        return null;
                      }
                    },
                    onSaved: (repeatPasswordVal) {
                      password = repeatPasswordVal;
                    },
                    labelText: 'Repeat Password',
                    obscureText: isRepeatPasswordVisible ? false : true,
                    textInputType: TextInputType.visiblePassword,
                    suffixIcon: IconButton(
                      icon: isRepeatPasswordVisible
                          ? const Icon(Icons.visibility)
                          : const Icon(Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          isRepeatPasswordVisible = !isRepeatPasswordVisible;
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
                    height: 10.h,
                  ),
                  /*
                      =========================================
                      = I Accept all Terms Start
                      =========================================
                      */
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
                        'I Accept all ',
                        style: MyStyles.textStyle12
                            .copyWith(color: MyColors.mainColor),
                      ),
                      InkWell(
                          child: Text(
                        "Terms, conditions and privacy policy",
                        style: MyStyles.textStyle14.copyWith(
                            color: MyColors.blue, fontWeight: FontWeight.bold),
                      )),
                    ],
                  ),
                  /*
                      =========================================
                      = Repeat Password Ends
                      =========================================
                      */
                  const SizedBox(
                    height: 50,
                  ),
                  /*
                      ==========================
                      = The Login Button Starts
                      ===========================
                      */
                  MainButton(
                      text: "Sign Up",
                      onPressed: () {
                        register();
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
