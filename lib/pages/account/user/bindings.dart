import 'package:get/get.dart';
import 'package:stone/pages/account/user/controller.dart';

class UserBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserController>(() => UserController());
  }
}
