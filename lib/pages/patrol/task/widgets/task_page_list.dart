import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:stone/pages/patrol/task/controller.dart';
import 'package:stone/pages/patrol/task/widgets/task_item.dart';

class TaskPageList extends GetView<TaskController> {
  const TaskPageList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<TaskController>(
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
                      return taskListItem(controller.state.taskList[index]);
                    },
                    childCount: controller.state.taskList.length,
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}
