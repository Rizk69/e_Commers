import 'package:ecommers/View/auth/login_screen.dart';
import 'package:ecommers/core/view_model/Auth_ViewModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/view_model/Control_View_Model.dart';

class ControlView extends GetWidget<AuthViewModel> {
  const ControlView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<AuthViewModel>().user == null)
          ? LoginScreen()
          : GetBuilder<ControlViewModel>(
              builder: (controller) => Scaffold(
                body: controller.currentScreen,
                bottomNavigationBar: bottomNavigationBar(),
              ),
            );
    });
  }

  Widget bottomNavigationBar() {
    return GetBuilder<ControlViewModel>(
      init: ControlViewModel(),
      builder: (ControlViewModel controller) => BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              label: '',
              activeIcon: const Padding(
                padding: EdgeInsets.only(top: 25),
                child: Text('Explore'),
              ),
              icon: Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Image.asset(
                  'Assets/Icon_Explore.png',
                  fit: BoxFit.contain,
                  width: 20,
                ),
              )),
          BottomNavigationBarItem(
              label: '',
              activeIcon: const Padding(
                padding: EdgeInsets.only(top: 25),
                child: Text('Cart'),
              ),
              icon: Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Image.asset(
                  'Assets/Icon_Cart.png',
                  fit: BoxFit.contain,
                  width: 20,
                ),
              )),
          BottomNavigationBarItem(
              label: '',
              activeIcon: const Padding(
                padding: EdgeInsets.only(top: 25),
                child: Text('Account'),
              ),
              icon: Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Image.asset(
                  'Assets/Icon_User.png',
                  fit: BoxFit.contain,
                  width: 20,
                ),
              )),
        ],
        currentIndex: controller.navigatorValue,
        elevation: 0,
        selectedItemColor: Colors.black,
        backgroundColor: Colors.grey.shade50,
        onTap: (index) {
          controller.changeSelectedValue(index);
        },
      ),
    );
  }
}
