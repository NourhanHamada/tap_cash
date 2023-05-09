import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tap_cash/app_routes.dart';
import 'package:tap_cash/constants/colors_manager.dart';
import 'package:tap_cash/constants/assets_manager.dart';
import 'package:tap_cash/constants/styles_manager.dart';
import 'package:tap_cash/controller/auth_controllers/login_controller.dart';
import 'package:tap_cash/providers/auth_provider.dart';
import 'package:tap_cash/utility/shared_preference.dart';
import 'package:tap_cash/view/utils/custom_text_form_field.dart';
import 'package:tap_cash/view/utils/main_button.dart';
import 'package:provider/provider.dart';
import 'package:another_flushbar/flushbar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // final _formKey = GlobalKey<FormState>();
  // final _emailController = TextEditingController();
  // final _passwordController = TextEditingController();
  // final _phoneFocusNode = FocusNode();
  // final _emailFocusNode = FocusNode();
  // final _passwordFocusNode = FocusNode();
  // final _repeatPasswordFocusNode = FocusNode();
  // bool isChecked = false;
  // bool isPasswordVisible = false;
  // bool isRepeatPasswordVisible = false;
  // String? email;
  // String? password;
  // late bool _rememberMe = false;

  @override
  void initState() {
    // _getRememberMe();
    super.initState();
  }

  // _getRememberMe() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   setState(() {
  //     _rememberMe = preferences.getBool('rememberMe') ?? false;
  //     if (_rememberMe) {
  //       _emailController.text = preferences.getString('email') ?? '';
  //       _passwordController.text = preferences.getString('password') ?? '';
  //     }
  //   });
  // }

  // _saveRememberMe(bool value) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.setBool('rememberMe', value);
  //   if (!value) {
  //     await prefs.remove('email');
  //     await prefs.remove('password');
  //   }
  // }

  // _saveCredentials() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.setString('email', _emailController.text);
  //   await prefs.setString('password', _passwordController.text);
  // }

  // @override
  // void dispose() {
  //   _emailController.dispose();
  //   _passwordController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);
    final loginController = Provider.of<LoginController>(context);
    final userPerferences = Provider.of<UserPerferences>(context);

    // void login() {
    //   final form = _formKey.currentState;
    //   if (form!.validate()) {
    //     form.save();
    //     auth.login(email, password).then((response) {
    //       if (response['status']) {
    //         // Provider.of<UserProvider>(context, listen: false).setUser(user);
    //         GoRouter.of(context).pushReplacement(AppRouter.layout);
    //       } else {
    //         Flushbar(
    //                 title: "login Failed",
    //                 message: response.toString(),
    //                 duration: const Duration(seconds: 10))
    //             .show(context);
    //       }
    //     });
    //   } else {
    //     Flushbar(
    //             title: "Invalid Form",
    //             message: 'please complete the form properly',
    //             duration: const Duration(seconds: 10))
    //         .show(context);
    //   }
    // }

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          //HEAD
          child: SingleChildScrollView(
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
                    ImageAssets.key,
                    width: 180.w,
                  ),
                ),
                Form(
                  key: loginController.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomTextFormField(
                        controller: loginController.emailController,
                        focusNode: loginController.emailFocusNode,
                        validator: (emailValue) => emailValue!.isEmpty
                            ? 'Please Enter Your Email'
                            // : !RegExp(r'^[\w-\.]+@([\w-]+\.)+\w{2,4}')
                            //         .hasMatch(emailValue)
                            //     ? 'Enter correct Email'
                            : null,
                        onSaved: (emailValue) {
                          loginController.setEmail(emailValue);
                        },
                        onEditingComplete: () => FocusScope.of(context)
                            .requestFocus(loginController.phoneFocusNode),
                        textInputAction: TextInputAction.next,
                        labelText: 'Email',
                        obscureText: false,
                        textInputType: TextInputType.emailAddress,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      CustomTextFormField(
                        controller: loginController.passwordController,
                        focusNode: loginController.passwordFocusNode,
                        validator: (passwordValue) => passwordValue!.isEmpty
                            ? 'Please Enter Your Password'
                            // : !RegExp(r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$")
                            //         .hasMatch(passwordValue)
                            //     ? 'Enter correct password'
                            : null,
                        onSaved: (passwordVal) {
                          loginController.setPassword(passwordVal);
                          // userPerferences.saveUser(user, AppRouter.loginScreen);
                        },
                        onEditingComplete: () => FocusScope.of(context)
                            .requestFocus(
                                loginController.repeatPasswordFocusNode),
                        textInputAction: TextInputAction.next,
                        labelText: 'Password',
                        obscureText:
                            loginController.isPasswordVisible ? false : true,
                        suffixIcon: IconButton(
                          icon: loginController.isPasswordVisible
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off),
                          onPressed: loginController.passwordVisiblity,
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
                                value: loginController.isChecked,
                                onChanged: (value) {
                                  loginController.selectCheckBox(value);
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
                              GoRouter.of(context).pushReplacement(
                                  AppRouter.verificationScreen);
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
                      loginController.login(auth, context);
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
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
