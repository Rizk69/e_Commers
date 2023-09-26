import 'package:ecommers/View/auth/Register_Screen.dart';
import 'package:ecommers/core/view_model/Auth_ViewModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constance.dart';
import '../Widget/CustomButtom.dart';
import '../Widget/CustomButtomSocial.dart';
import '../Widget/CustomText.dart';
import '../Widget/CustomTextFormField.dart';

class LoginScreen extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _key = GlobalKey();

  late String email, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
        child: SingleChildScrollView(
          child: Form(
            key: _key,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CustomText(
                        text: 'Welcome,', fontSize: 30, color: Colors.black),
                    GestureDetector(
                      onTap: () {
                        Get.to(RegisterScreen());
                      },
                      child: const CustomText(
                          text: 'Sign Up', fontSize: 13, color: primaryColor),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const CustomText(
                    text: 'Sign in to Continue',
                    fontSize: 14,
                    color: Colors.grey),
                const SizedBox(
                  height: 30,
                ),
                CustomTextFormField(
                  hint: 'iamdavid@gmail.com',
                  text: 'Email',
                  validator: (value) {
                    if (value == null) {
                      print('error');
                    }
                  },
                  onSave: (value) {
                    controller.email = value!;
                  },
                ),
                const SizedBox(
                  height: 40,
                ),
                CustomTextFormField(
                  hint: '************',
                  text: 'Password',
                  validator: (value) {
                    if (value == null) {
                      print('error');
                    }
                  },
                  onSave: (value) {
                    controller.password = value!;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                const CustomText(
                    text: 'Forget Password',
                    fontSize: 14,
                    alignment: Alignment.topRight),
                SizedBox(
                  height: 20,
                ),
                CustomButtom(
                    text: 'SIGN IN',
                    onPressed: () {
                      _key.currentState?.save();
                      if (_key.currentState!.validate()) {
                        controller.signInWithEmailAndPassword();
                      }
                    }),
                SizedBox(
                  height: 20,
                ),
                CustomText(
                  text: '- OR -',
                  fontSize: 17,
                  alignment: Alignment.center,
                ),
                SizedBox(
                  height: 15,
                ),
                CustomButtomSocial(
                    text: 'Sign In with Facebook',
                    imagePath: 'Assets/Icon_Facebook.png',
                    onPressed: () {
                      controller.faceBookSignInMethod();
                    }),
                SizedBox(
                  height: 10,
                ),
                CustomButtomSocial(
                    text: 'Sign In with Google',
                    imagePath: 'Assets/icons8_Google_2.png',
                    onPressed: () {
                      controller.googleSignInMethod();
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
