import 'package:get/get.dart';
import 'package:stone/common/routers/names.dart';

class UserController extends GetxController {
  UserController();


  // 跳转 注册界面
  tiaozhuan() {
    Get.toNamed(AppRoutes.Device);
  }
}
