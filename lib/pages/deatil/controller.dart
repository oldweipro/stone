import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stone/common/apis/device.dart';
import 'package:stone/common/entities/device.dart';
import 'package:stone/common/entities/request.dart';
import 'package:stone/common/values/server.dart';
import 'package:stone/common/widgets/widgets.dart';
import 'package:stone/pages/deatil/state.dart';

class DeviceDetailController extends GetxController {
  DeviceDetailController();

  /// 响应式成员变量
  final state = DeviceDetailState();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController ipController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController commandPortController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    state.deviceItem.value = Get.arguments as DeviceItem;
    titleController.text = state.deviceItem.value.title ?? "";
    ipController.text = state.deviceItem.value.ipv4Address ?? "";
    usernameController.text = state.deviceItem.value.username ?? "";
    passwordController.text = state.deviceItem.value.password ?? "";
    commandPortController.text = state.deviceItem.value.commandPort ?? "";
  }

  _refresh() {
    deviceInfoByIp();
  }

  // 设备登录
  deviceLogin() async {
    RequestLoginParams requestLoginParams = RequestLoginParams(
      title: titleController.value.text,
      ipv4Address: ipController.value.text,
      username: usernameController.value.text,
      password: passwordController.value.text,
      commandPort: commandPortController.value.text,
    );
    var result = await DeviceAPI.deviceLogin(
      params: requestLoginParams,
    );
    _refresh();
    toastInfo(msg: result.msg ?? "设备注册");
  }

  // 设备注销
  deviceLogout() async {
    var result = await DeviceAPI.deviceClean(
      ipv4Address: ipController.value.text,
    );
    _refresh();
    toastInfo(msg: result.msg ?? "设备注销");
  }

  // 根据设备IP获取设备信息
  deviceInfoByIp() async {
    var result = await DeviceAPI.deviceInfoByIp(
      ipv4Address: ipController.value.text,
    );
    state.deviceItem.value = DeviceItem.fromJson(result.data);
  }

  // 设备布防
  deviceSetupAlarm() async {
    var result = await DeviceAPI.deviceSetupAlarm(
      ipv4Address: ipController.value.text,
    );
    _refresh();
    toastInfo(msg: result.msg ?? "设备布防");
  }

  // 设备撤防
  deviceCloseAlarm() async {
    var result = await DeviceAPI.deviceCloseAlarm(
      ipv4Address: ipController.value.text,
    );
    _refresh();
    toastInfo(msg: result.msg ?? "设备撤防");
  }

  // 设备截图
  captureJpegPictureToLocal(int channelId) async {
    var result = await DeviceAPI.captureJpegPictureToLocal(
      ipv4Address: ipController.value.text,
      channelId: channelId,
      picQuality: 0,
      picSize: 0,
    );
    state.deviceItem.value.screenPicture = "$SERVER_API_URL${result.data}";
    _refresh();
    toastInfo(msg: result.msg ?? "设备截图");
  }

  channelVisibleClick() {
    state.channelVisible.value = !state.channelVisible.value;
  }

  playPreviewVisibleClick() {
    state.previewVisible.value = !state.previewVisible.value;
  }
}
