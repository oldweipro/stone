import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:stone/common/apis/event.dart';
import 'package:stone/common/entities/event.dart';
import 'package:stone/pages/event/state.dart';

class EventController extends GetxController {
  EventController();

  /// 响应式成员变量
  final state = EventState();

  /// 成员变量
  String deviceCode = '';
  int curPage = 1;
  int pageSize = 6;
  int total = 6;

  /// UI 组件
  final RefreshController refreshController = RefreshController(
    initialRefresh: true,
  );

  void onRefresh() {
    fetchEventList(isRefresh: true).then((_) {
      refreshController.refreshCompleted(resetFooterState: true);
    }).catchError((_) {
      refreshController.refreshFailed();
    });
  }

  void onLoading() {
    if (state.eventList.length < total) {
      fetchEventList().then((_) {
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
  Future<void> fetchEventList({bool isRefresh = false}) async {
    if (isRefresh) {
      curPage = 1;
    } else {
      curPage++;
    }
    var result = await EventAPI.eventPageList(
      params: EventPageListRequestEntity(
        pageNum: curPage,
        pageSize: pageSize,
      ),
    );
    if (isRefresh) {
      total = result.counts!;
      state.eventList.clear();
    }
    state.eventList.addAll(result.items!);
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
