import 'package:amap_flutter_location/amap_flutter_location.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
// import 'package:im_flutter_sdk/im_flutter_sdk.dart';
import 'package:stone/common/services/services.dart';
import 'package:stone/common/store/store.dart';
import 'package:stone/common/utils/amap.dart';
import 'package:stone/common/utils/utils.dart';
import 'package:get/get.dart';

/// 全局静态数据
class Global {
  /// 初始化
  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    setSystemUi();
    Loading();
    AMap();

    await Get.putAsync<StorageService>(() => StorageService().init());

    Get.put<ConfigStore>(ConfigStore());
    Get.put<UserStore>(UserStore());
    //环信初始化
    // initSDK();
  }

  static void setSystemUi() {
    if (GetPlatform.isAndroid) {
      SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarDividerColor: Colors.transparent,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      );
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }
  }

  // static void initSDK() async {
  //   var options = EMOptions(
  //     appKey: '1102200603113637#oldwei',
  //     deleteMessagesAsExitGroup: false,
  //     deleteMessagesAsExitChatRoom: false,
  //     autoAcceptGroupInvitation: true,
  //     debugModel: true,
  //   );
  //
  //   options.enableAPNs("EaseIM_APNS_Product");
  //   await EMClient.getInstance.init(options);
  //   debugPrint("has init");
  // }
}
