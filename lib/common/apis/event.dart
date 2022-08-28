import 'package:stone/common/entities/event.dart';
import 'package:stone/common/utils/http.dart';
import 'package:stone/common/values/storage.dart';

class EventAPI{
  /// 翻页
  /// refresh 是否刷新
  static Future<EventPageListResponseEntity> eventPageList({
    EventPageListRequestEntity? params,
    bool refresh = false,
    bool cacheDisk = false,
  }) async {
    var response = await HttpUtil().get(
      '/api/device/getDeviceSearchInfoList',
      queryParameters: params?.toJson(),
      refresh: refresh,
      cacheDisk: cacheDisk,
      cacheKey: STORAGE_INDEX_EVENT_CACHE_KEY,
    );
    // final map = response['data']['items'] as List;
    // print("打印: ${map[0]['digitalChannelIds']}");
    return EventPageListResponseEntity.fromJson(response);
  }
}
