import 'package:stone/pages/account/controller.dart';
import 'package:stone/pages/category/index.dart';
import 'package:stone/pages/device/index.dart';
import 'package:stone/pages/event/controller.dart';
import 'package:get/get.dart';

import 'controller.dart';

class ApplicationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApplicationController>(() => ApplicationController());
    Get.lazyPut<CategoryController>(() => CategoryController());
    Get.lazyPut<DeviceController>(() => DeviceController());
    Get.lazyPut<EventController>(() => EventController());
    Get.lazyPut<AccountController>(() => AccountController());
  }
}
