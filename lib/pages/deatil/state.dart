import 'package:get/get.dart';
import 'package:stone/common/entities/device.dart';

class DeviceDetailState {
  // 设备翻页
  Rx<DeviceItem> deviceItem = DeviceItem().obs;
  Rx<bool> channelVisible = false.obs;
  @Deprecated("没啥用了")
  Rx<bool> previewVisible = true.obs;
}
