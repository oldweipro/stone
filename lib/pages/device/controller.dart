import 'package:stone/common/apis/device.dart';
import 'package:stone/common/entities/device.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'index.dart';

class DeviceController extends GetxController {
  DeviceController();

  /// UI 组件
  final RefreshController refreshController = RefreshController(
    initialRefresh: true,
  );

  /// 响应式成员变量
  final state = DeviceState();

  /// 成员变量
  String deviceCode = '';
  int curPage = 1;
  int pageSize = 5;
  int total = 5;

  /// 事件

  void onRefresh() {
    fetchDeviceList(isRefresh: true).then((_) {
      refreshController.refreshCompleted(resetFooterState: true);
    }).catchError((_) {
      refreshController.refreshFailed();
    });
  }

  void onLoading() {
    if (state.deviceList.length < total) {
      fetchDeviceList().then((_) {
        refreshController.loadComplete();
      }).catchError((_) {
        refreshController.loadFailed();
      });
    } else {
      refreshController.loadNoData();
    }
  }

  // 方法

  // 拉取数据
  Future<void> fetchDeviceList({bool isRefresh = false}) async {
    if (isRefresh) {
      curPage = 1;
    } else {
      curPage++;
    }
    var result = await DeviceAPI.devicePageList(
      params: DevicePageListRequestEntity(
        pageNum: curPage,
        pageSize: pageSize,
      ),
    );
    if (isRefresh) {
      total = result.counts!;
      state.deviceList.clear();
    }
    state.deviceList.addAll(result.items!);
  }

  /// 生命周期

  ///dispose 释放内存
  @override
  void dispose() {
    super.dispose();
    // dispose 释放对象
    refreshController.dispose();
  }
}
