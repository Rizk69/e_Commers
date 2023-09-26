import 'package:ecommers/View/Widget/CustomButtom.dart';
import 'package:ecommers/View/Widget/CustomText.dart';
import 'package:ecommers/View/Widget/CustomTextFormField.dart';
import 'package:ecommers/View/auth/login_screen.dart';
import 'package:ecommers/core/view_model/Auth_ViewModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreen extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.to(LoginScreen());
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 80, left: 30, right: 30),
        child: SingleChildScrollView(
          child: Form(
            key: _key,
            child: Column(
              children: [
                CustomText(text: 'Sign Up', fontSize: 30, color: Colors.black),
                const SizedBox(
                  height: 50,
                ),
                CustomTextFormField(
                  hint: 'Saad',
                  text: 'Name',
                  validator: (value) {
                    if (value == null) {
                      print('error');
                    }
                  },
                  onSave: (value) {
                    controller.name = value!;
                  },
                ),
                const SizedBox(
                  height: 35,
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
                  height: 35,
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
                SizedBox(
                  height: 40,
                ),
                CustomButtom(
                    text: 'SIGN UP',
                    onPressed: () {
                      _key.currentState?.save();
                      if (_key.currentState!.validate()) {
                        controller.signUpWithEmailAndPassword();
                      }
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
