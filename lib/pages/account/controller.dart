import 'package:get/get.dart';
import 'package:stone/common/routers/names.dart';

class AccountController extends GetxController {
  AccountController();


  // 跳转 注册界面
  tiaozhuan() {
    Get.toNamed(AppRoutes.DeviceDetail);
  }
}
