import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stone/common/entities/patrol/task.dart';

Widget taskListItem(TaskItem taskItem) {
  return Container(
    height: 161.h,
    padding: EdgeInsets.all(20.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        InkWell(
          onTap: () {
            print('按下了按钮');
          },
          child: const Text('这是个按钮'),
        ),
        SizedBox(
          width: 194.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(0),
                child: Text('${taskItem.taskName}'),
              )
            ],
          ),
        )
      ],
    ),
  );
}
