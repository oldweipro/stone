import 'package:stone/common/entities/patrol/task.dart';
import 'package:stone/common/utils/http.dart';
import 'package:stone/common/values/storage.dart';

class TaskAPI{
  /// 翻页
  /// refresh 是否刷新
  static Future<TaskPageListResponseEntity> taskPageList({
    TaskPageListRequestEntity? params,
    bool refresh = false,
    bool cacheDisk = false,
  }) async {
    var response = await HttpUtil().get(
      '/patrolTask/getPatrolTaskList',
      queryParameters: params?.toJson(),
      refresh: refresh,
      cacheDisk: cacheDisk,
      cacheKey: STORAGE_INDEX_TASK_CACHE_KEY,
    );
    return TaskPageListResponseEntity.fromJson(response);
  }
}
