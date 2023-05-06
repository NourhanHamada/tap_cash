import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:tap_cash/app_routes.dart';
import 'package:tap_cash/constants/colors.dart';
import 'package:tap_cash/constants/images.dart';
import 'package:tap_cash/constants/styles.dart';
import 'package:tap_cash/models/user_models.dart';
import 'package:tap_cash/providers/auth_provider.dart';
import 'package:tap_cash/providers/user_provider.dart';
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
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _repeatPasswordFocusNode = FocusNode();
  bool isChecked = false;
  bool isPasswordVisible = true;
  bool isRepeatPasswordVisible = false;
  String? email;
  String? password;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);
    void login() {
      final form = _formKey.currentState;
      if (form!.validate()) {
        form.save();
        auth.login(email, password).then((response) {
          if (response['status']) {
            // Provider.of<UserProvider>(context, listen: false).setUser(user);
            GoRouter.of(context).pushReplacement(AppRouter.newPassword);
          } else {
            Flushbar(
                    title: "login Failed",
                    message: response.toString(),
                    duration: const Duration(seconds: 10))
                .show(context);
          }
        });
      } else {
        Flushbar(
                title: "Invalid Form",
                message: 'please complete the form properly',
                duration: const Duration(seconds: 10))
            .show(context);
      }
    }

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
                                    .hasMatch(emailValue)
                                ? 'Enter correct Email'
                                : null,
                        onSaved: (emailValue) {
                          email = emailValue;
                        },
                        onEditingComplete: () => FocusScope.of(context)
                            .requestFocus(_phoneFocusNode),
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
                            // : !RegExp(r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$")
                            //         .hasMatch(passwordValue)
                            //     ? 'Enter correct password'
                            : null,
                        onSaved: (passwordVal) {
                          password = passwordVal;
                        },
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
                                value: isChecked,
                                onChanged: (value) {
                                  isChecked = value!;
                                  setState(() {
                                    isChecked != isChecked;
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
                      login();
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



// TO DO :
// Remember Me


  // Future<void> _login(AuthController model) async {
  //   try {
  //     await model.login(email, password);
  //     if (!mounted) return;
  //     GoRouter.of(context).pushReplacement(AppRouter.newPassword);
  //   } catch (e) {
  //     showDialog(
  //         context: context,
  //         builder: (_) => AlertDialog(
  //               title: Text(
  //                 'Error!',
  //                 style: Theme.of(context).textTheme.titleLarge,
  //               ),
  //               content: Text(
  //                 e.toString(),
  //                 style: Theme.of(context).textTheme.titleMedium,
  //               ),
  //               actions: [
  //                 TextButton(
  //                     onPressed: () => Navigator.of(context).pop(),
  //                     child: const Text('Ok'))
  //               ],
  //             ));
  //   }
  // }