import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../View/Home_Screen/Account_View.dart';
import '../../View/Home_Screen/Cart_View.dart';
import '../../View/Home_Screen/Home_Screen.dart';

class ControlViewModel extends GetxController {
  Widget _currentScreen = HomeScreen();

  get currentScreen {
    return _currentScreen;
  }

  int _navigatorValue = 0;

  get navigatorValue => _navigatorValue;

  void changeSelectedValue(int selectedValue) {
    _navigatorValue = selectedValue;
    switch (selectedValue) {
      case 0:
        {
          _currentScreen = HomeScreen();
          break;
        }
      case 1:
        {
          _currentScreen = CartView();
          break;
        }
      case 2:
        {
          _currentScreen = AccountView();
          break;
        }
    }
    update();
  }
}
