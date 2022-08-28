import 'package:stone/common/entities/device.dart';
import 'package:stone/common/entities/request.dart';
import 'package:stone/common/utils/http.dart';
import 'package:stone/common/values/values.dart';

/// 设备接口
class DeviceAPI {
  /// 翻页
  /// refresh 是否刷新
  static Future<DevicePageListResponseEntity> devicePageList({
    DevicePageListRequestEntity? params,
    bool refresh = false,
    bool cacheDisk = false,
  }) async {
    var response = await HttpUtil().get(
      '/api/device/getDeviceSearchInfoList',
      queryParameters: params?.toJson(),
      refresh: refresh,
      cacheDisk: cacheDisk,
      cacheKey: STORAGE_INDEX_DEVICE_CACHE_KEY,
    );
    // final map = response['data']['items'] as List;
    // print("打印: ${map[0]['digitalChannelIds']}");
    return DevicePageListResponseEntity.fromJson(response);
  }

  // 设备登录
  static Future<ResponseResult> deviceLogin({
    RequestLoginParams? params,
  }) async {
    var response = await HttpUtil().post(
      '/api/device/login',
      data: params?.toJson(),
    );
    return ResponseResult.fromJson(response);
  }

  // 设备注销
  static Future<ResponseResult> deviceClean({
    String? ipv4Address,
  }) async {
    var response = await HttpUtil().post(
      '/api/device/clean/$ipv4Address',
    );
    return ResponseResult.fromJson(response);
  }

  /// refresh 是否刷新
  static Future<ResponseResult> deviceInfoByIp({
    required String ipv4Address,
  }) async {
    var response = await HttpUtil().get(
      '/api/device/getDeviceInfoByIp/$ipv4Address',
    );
    return ResponseResult.fromJson(response);
  }

  // 设备布防
  static Future<ResponseResult> deviceSetupAlarm({
    required String ipv4Address
  }) async {
    var response = await HttpUtil().post(
      '/api/device/setupAlarm/$ipv4Address',
    );
    print("返回结果: $response");
    return ResponseResult.fromJson(response);
  }

  // 设备撤防
  static Future<ResponseResult> deviceCloseAlarm({
    String? ipv4Address,
  }) async {
    var response = await HttpUtil().post(
      '/api/device/closeAlarm/$ipv4Address',
    );
    return ResponseResult.fromJson(response);
  }

  // 设备撤防
  static Future<ResponseResult> captureJpegPictureToLocal({
    String? ipv4Address,
    int? channelId,
    int? picQuality,
    int? picSize,
  }) async {
    var response = await HttpUtil().get(
      '/api/device/captureJpegPictureToLocal/$ipv4Address',
      queryParameters: {
        "channelId": channelId,
        "picQuality": picQuality,
        "picSize": picSize,
      }
    );
    return ResponseResult.fromJson(response);
  }
}
