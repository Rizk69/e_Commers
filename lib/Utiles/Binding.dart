import 'package:ecommers/core/view_model/Auth_ViewModel.dart';
import 'package:ecommers/core/view_model/Home_View_Model.dart';
import 'package:get/get.dart';

import '../core/view_model/Control_View_Model.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeViewModel());
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => ControlViewModel());
  }
}
