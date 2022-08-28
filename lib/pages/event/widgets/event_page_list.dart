import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:stone/pages/event/controller.dart';
import 'package:stone/pages/event/widgets/event_item.dart';

class EventPageList extends GetView<EventController> {
  const EventPageList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<EventController>(
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
                      var item = controller.state.eventList[index];
                      return eventListItem(item);
                    },
                    childCount: controller.state.eventList.length,
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}
