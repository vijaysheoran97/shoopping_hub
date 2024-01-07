import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shoopping_hub/controllers/sign_in_controller.dart';
import 'package:shoopping_hub/screens/auth_ui/forget_password_screen.dart';
import 'package:shoopping_hub/screens/auth_ui/sign_up_screen.dart';
import 'package:shoopping_hub/screens/user_panel/main_screen.dart';
import 'package:shoopping_hub/utils/app_constant.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final SignInController signInController = Get.put(SignInController());
  TextEditingController userEmail = TextEditingController();
  TextEditingController userPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(
      builder: (context, isKeyboardVisible) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppConstant.appScendoryColor,
            centerTitle: true,
            title: const Text(
              'Sign In',
              style: TextStyle(color: AppConstant.appTextColor),
            ),
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                isKeyboardVisible
                    ? const Text(
                        'Welcome to Shopping Hub',
                        style: TextStyle(
                            color: AppConstant.appScendoryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      )
                    : Column(
                        children: [
                          Lottie.asset('assets/images/splash-icon.json')
                        ],
                      ),
                SizedBox(
                  height: Get.height / 20,
                ),
                Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    width: Get.width,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextFormField(
                        controller: userEmail,
                        cursorColor: AppConstant.appScendoryColor,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            hintText: 'Email',
                            prefixIcon: const Icon(Icons.email_outlined),
                            contentPadding:
                                const EdgeInsets.only(top: 2, left: 8),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    )),
                Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    width: Get.width,
                    child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Obx(
                          () => TextFormField(
                            controller: userPassword,
                            obscureText:
                                signInController.isPasswordVisible.value,
                            cursorColor: AppConstant.appScendoryColor,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                                hintText: 'Password',
                                prefixIcon: const Icon(Icons.password),
                                suffixIcon: GestureDetector(
                                    onTap: () {
                                      signInController.isPasswordVisible
                                          .toggle();
                                    },
                                    child:
                                        signInController.isPasswordVisible.value
                                            ? const Icon(Icons.visibility_off)
                                            : const Icon(Icons.visibility)),
                                contentPadding:
                                    const EdgeInsets.only(top: 2, left: 8),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                        ))),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: (){
                      Get.to(() => const ForgetPasswordScreen());
                    },
                    child: const Text(
                      'Forget Password?',
                      style: TextStyle(
                          color: AppConstant.appScendoryColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height / 20,
                ),
                Material(
                  child: Container(
                    width: Get.width / 2,
                    height: Get.height / 18,
                    decoration: BoxDecoration(
                        color: AppConstant.appScendoryColor,
                        borderRadius: BorderRadius.circular(20)),
                    child: TextButton(
                      child: const Text(
                        'SIGN IN',
                        style: TextStyle(color: AppConstant.appTextColor),
                      ),
                      onPressed: () async {
                        String email = userEmail.text.trim();
                        String password = userPassword.text.trim();

                        if (email.isEmpty || password.isEmpty) {
                          Get.snackbar('Error', 'Please enter all details',
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: AppConstant.appScendoryColor,
                            colorText: AppConstant.appTextColor,
                          );
                        } else {
                          UserCredential? userCredential =
                              await signInController.signInMethod(
                                  email, password);
                          if (userCredential != null) {
                            if (userCredential.user!.emailVerified) {
                              Get.snackbar('Success',
                                  'Login Successfully!',
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: AppConstant.appScendoryColor,
                                colorText: AppConstant.appTextColor,
                              );
                              Get.offAll(() => const MainScreen());
                            } else {
                              Get.snackbar('Error',
                                  'Please verify your email before login',
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: AppConstant.appScendoryColor,
                                colorText: AppConstant.appTextColor,
                              );
                            }
                          }
                          else{
                            Get.snackbar('Error',
                              'Please try again',
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: AppConstant.appScendoryColor,
                              colorText: AppConstant.appTextColor,
                            );
                          }
                        }
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height / 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account? ",
                      style: TextStyle(color: AppConstant.appScendoryColor),
                    ),
                    GestureDetector(
                      onTap: () => Get.offAll(() => const SignUpScreen()),
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                            color: AppConstant.appScendoryColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
