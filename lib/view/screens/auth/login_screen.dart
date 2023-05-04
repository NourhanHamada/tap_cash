import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tap_cash/app_routes.dart';
import 'package:tap_cash/constants/colors.dart';
import 'package:tap_cash/constants/images.dart';
import 'package:tap_cash/constants/styles.dart';
import 'package:tap_cash/view/utils/custom_text_form_field.dart';
import 'package:tap_cash/view/utils/main_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  // final _firstnameController = TextEditingController();
  // final _lastnameController = TextEditingController();
  final _emailController = TextEditingController();
  // final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  // final _repeatPasswordController = TextEditingController();
  // final _firstnameFocusNode = FocusNode();
  // final _lastnameFocusNode = FocusNode();
  final _phoneFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _repeatPasswordFocusNode = FocusNode();
  bool isChecked = false;
  bool isPasswordVisible = false;
  bool isRepeatPasswordVisible = false;
  late bool _rememberMe = false;

  @override
  void initState() {
    _getRememberMe();
    super.initState();
  }

  _getRememberMe() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      _rememberMe = preferences.getBool('rememberMe') ?? false;
      if(_rememberMe){
        _emailController.text = preferences.getString('email') ?? '';
        _passwordController.text = preferences.getString('password') ?? '' ;
      }
    });
  }

  _saveRememberMe(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('rememberMe', value);
    if (!value) {
      await prefs.remove('email');
      await prefs.remove('password');
    }
  }

  _saveCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', _emailController.text);
    await prefs.setString('password', _passwordController.text);
  }

  // @override
  // void dispose() {
  //   _emailController.dispose();
  //   _passwordController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          //HEAD
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
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomTextFormField(
                      controller: _emailController,
                      focusNode: _emailFocusNode,
                      validator: (emailValue) => emailValue!.isEmpty
                          ? 'Please Enter Your Email'
                          : !RegExp(r'^[\w-\.]+@([\w-]+\.)+\w{2,4}')
                          .hasMatch(emailValue) ? 'Enter correct Email'
                          : null,
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
                      validator: (passwordValue) => passwordValue!.isEmpty
                          ? 'Please Enter Your Password'
                          : !RegExp(r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$")
                                  .hasMatch(passwordValue)
                              ? 'Enter correct password'
                              : null,
                      onEditingComplete: () => FocusScope.of(context)
                          .requestFocus(_repeatPasswordFocusNode),
                      textInputAction: TextInputAction.next,
                      labelText: 'Password',
                      obscureText: isPasswordVisible ? false : true,
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
                      textInputType: TextInputType.visiblePassword,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // <<<<<<< HEAD
                        Row(
                          children: [
                            Checkbox(
                              value: _rememberMe,
                              onChanged: (value) {
                                isChecked = value!;
                                setState(() {
                                  _rememberMe = value!;
                                  _saveRememberMe(value);
                                });
                              },
                              materialTapTargetSize:
                                  MaterialTapTargetSize.padded,
                              visualDensity: VisualDensity.compact,
                            ),
                            Text(
                              'Remember me',
                              style: MyStyles.textStyle14
                                  .copyWith(color: MyColors.mainColor),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            GoRouter.of(context)
                                .pushReplacement(AppRouter.newPassword);
                          },
                          child: Text(
                            'Forgot password?',
                            style: MyStyles.textStyle14.copyWith(
                              color: MyColors.grey,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                  ],
                ),
              ),
/*
                  ===========================
                  = The Login Button Starts
                  ===========================
                  */
              MainButton(
                  text: "Login",
                  onPressed: () {
                    _saveCredentials();
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
                    style: MyStyles.textStyle14.copyWith(color: MyColors.grey),
                  ),
                  InkWell(
                    onTap: () => GoRouter.of(context)
                        .pushReplacement(AppRouter.signupScreen),
                    child: Text(
                      "Sign Up ?",
                      style: MyStyles.textStyle14.copyWith(
                          color: MyColors.mainColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// TO DO :
// Remember Me