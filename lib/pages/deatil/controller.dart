import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stone/common/apis/device.dart';
import 'package:stone/common/entities/device.dart';
import 'package:stone/common/entities/request.dart';
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
    // 更新上一页列表中的信息
    state.deviceItem.value.title = titleController.text;
    state.deviceItem.value.ipv4Address = ipController.text;
    state.deviceItem.value.username = usernameController.text;
    state.deviceItem.value.password = passwordController.text;
    state.deviceItem.value.commandPort = commandPortController.text;
    // deviceInfoByIp();
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
    deviceInfoByIp();
    toastInfo(msg: result.msg ?? "设备注册");
  }

  // 设备注销
  deviceLogout() async {
    var result = await DeviceAPI.deviceClean(
      ipv4Address: ipController.value.text,
    );
    deviceInfoByIp();
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
    deviceInfoByIp();
    toastInfo(msg: result.msg ?? "设备布防");
  }

  // 设备撤防
  deviceCloseAlarm() async {
    var result = await DeviceAPI.deviceCloseAlarm(
      ipv4Address: ipController.value.text,
    );
    deviceInfoByIp();
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
    // TODO 直接改变state.deviceItem.value.screenPicture = result.data;不起作用;不知道为什么执行deviceInfoByIp();就可以刷新页面
    deviceInfoByIp();
    toastInfo(msg: result.msg ?? "设备截图");
  }

  channelVisibleClick() {
    state.channelVisible.value = !state.channelVisible.value;
  }

  modifyDeviceInfoClick() async {
    RequestDeviceInfoParams requestDeviceInfoParams = RequestDeviceInfoParams(
      title: titleController.value.text,
      ipv4Address: ipController.value.text,
      username: usernameController.value.text,
      password: passwordController.value.text,
      commandPort: commandPortController.value.text,
    );
    var result = await DeviceAPI.modifyDeviceInfo(
      params: requestDeviceInfoParams,
    );
    _refresh();
    toastInfo(msg: result.msg ?? "设备信息修改");
  }
}
