import 'package:get/get.dart';
import 'package:stone/pages/deatil/controller.dart';

class DeviceDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DeviceDetailController>(() => DeviceDetailController());
  }
}
