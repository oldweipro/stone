import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:stone/common/values/colors.dart';
import 'package:stone/common/values/server.dart';
import 'package:stone/common/widgets/app.dart';
import 'package:stone/common/widgets/button.dart';
import 'package:stone/common/widgets/image.dart';
import 'package:stone/common/widgets/input.dart';
import 'package:stone/common/widgets/video_player.dart';
import 'package:stone/pages/deatil/controller.dart';

class DeviceDetailPage extends GetView<DeviceDetailController> {
  const DeviceDetailPage({Key? key}) : super(key: key);

  Widget _buildItem(int channelId) => InkWell(
        onTap: () {
          controller.captureJpegPictureToLocal(channelId);
        },
        child: Container(
          alignment: Alignment.center,
          width: 100,
          height: 30,
          child: Text("$channelId"),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return GetX<DeviceDetailController>(
      init: controller,
      builder: (controller) => Scaffold(
        appBar: transparentAppBar(
          title: Text(
            controller.state.deviceItem.value.title ??
                controller.state.deviceItem.value.title ??
                '设备详情',
            style: TextStyle(
              color: AppColors.primaryText,
              fontFamily: 'Montserrat',
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.search,
                color: AppColors.primaryText,
              ),
              onPressed: () {},
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              width: 295.w,
              margin: EdgeInsets.only(top: 49.h),
              child: Column(
                children: [
                  netImageCached(
                    "$SERVER_API_URL${controller.state.deviceItem.value.screenPicture}",
                    width: 221.w,
                    height: 121.w,
                  ),
                  inputTextEdit(
                    controller: controller.titleController,
                    keyboardType: TextInputType.text,
                    hintText: "设备名称",
                    marginTop: 10,
                  ),
                  inputTextEdit(
                    controller: controller.ipController,
                    keyboardType: TextInputType.number,
                    hintText: "IP地址",
                    marginTop: 10,
                  ),
                  inputTextEdit(
                    controller: controller.usernameController,
                    keyboardType: TextInputType.text,
                    hintText: "账号",
                    marginTop: 10,
                  ),
                  inputTextEdit(
                    controller: controller.passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    hintText: "密码",
                    marginTop: 10,
                  ),
                  inputTextEdit(
                    controller: controller.commandPortController,
                    keyboardType: TextInputType.number,
                    hintText: "端口",
                    marginTop: 10,
                  ),
                  Container(
                    height: 44.h,
                    margin: EdgeInsets.only(top: 15.h),
                    child: Row(
                      children: [
                        // 注册
                        controller.state.deviceItem.value.loginId! > -1
                            ? btnFlatButtonWidget(
                                onPressed: controller.deviceLogout,
                                gbColor: AppColors.thirdElement,
                                title: "注销",
                              )
                            : btnFlatButtonWidget(
                                onPressed: controller.deviceLogin,
                                gbColor: AppColors.primaryElement,
                                title: "登录",
                              ),
                        const Spacer(),
                        // 登录
                        controller.state.deviceItem.value.alarmHandleId! > -1
                            ? btnFlatButtonWidget(
                                onPressed: controller.deviceCloseAlarm,
                                gbColor: AppColors.thirdElement,
                                title: "撤防",
                              )
                            : btnFlatButtonWidget(
                                onPressed: controller.deviceSetupAlarm,
                                gbColor: AppColors.primaryElement,
                                title: "布防",
                              ),
                      ],
                    ),
                  ),
                  Container(
                    height: 44.h,
                    margin: EdgeInsets.only(top: 15.h),
                    child: Row(
                      children: [
                        btnFlatButtonWidget(
                          onPressed: controller.channelVisibleClick,
                          gbColor: AppColors.primaryElement,
                          title: "截图",
                        ),
                        const Spacer(),
                        // 登录
                        btnFlatButtonWidget(
                          onPressed: controller.playPreviewVisibleClick,
                          gbColor: AppColors.primaryElement,
                          title: "预览",
                        ),
                      ],
                    ),
                  ),
                  controller.state.channelVisible.value
                      ? Column(
                          children: [
                            const SizedBox(height: 10),
                            GridView.count(
                              shrinkWrap: true,
                              crossAxisCount: 8,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                              childAspectRatio: 1 / 0.5,
                              children: controller
                                  .state.deviceItem.value.deviceChannels!
                                  .where((element) => element.byEnable == 1)
                                  .map((deviceChannel) =>
                                      _buildItem(deviceChannel.channelId!))
                                  .toList(),
                            )
                          ],
                        )
                      : const SizedBox(height: 10),
                  controller.state.previewVisible.value
                      ? Column(
                          children: [
                            ListView.builder(
                              itemCount: controller
                                  .state.deviceItem.value.deviceChannels!
                                  .where((element) => element.byEnable == 1)
                                  .toList()
                                  .length,
                              itemBuilder: (context, index) => HlsPlayer(
                                  src:
                                      '$SERVER_CAMERA_URL/stream/${controller.state.deviceItem.value.deviceId}/channel/${controller.state.deviceItem.value.deviceChannels?[index].channelId}/hlsll/live/index.m3u8'),
                              shrinkWrap: true,
                            ),
                          ],
                        )
                      : const SizedBox(height: 10)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
