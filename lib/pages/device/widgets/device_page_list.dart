import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stone/common/routers/routes.dart';
import 'package:stone/pages/device/index.dart';

import 'widgets.dart';

class DevicePageList extends StatefulWidget {
  const DevicePageList({Key? key}) : super(key: key);

  @override
  State<DevicePageList> createState() => _DevicePageListState();
}

class _DevicePageListState extends State<DevicePageList>
    with AutomaticKeepAliveClientMixin, RouteAware {
  @override
  bool get wantKeepAlive => true;

  final controller = Get.find<DeviceController>();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    AppPages.observer.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void didPopNext() {
    print('oh yes, didPopNext');
    controller.fetchDeviceList(isRefresh: true);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return GetX<DeviceController>(
      init: controller,
      builder: (controller) => SmartRefresher(
        enablePullUp: true,
        controller: controller.refreshController,
        onRefresh: controller.onRefresh,
        onLoading: controller.onLoading,
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: EdgeInsets.symmetric(
                vertical: 0.w,
                horizontal: 0.w,
              ),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                      (content, index) {
                    var item = controller.state.deviceList[index];
                    return deviceListItem(item);
                  },
                  childCount: controller.state.deviceList.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
