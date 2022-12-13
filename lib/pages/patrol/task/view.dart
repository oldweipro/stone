import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:stone/pages/patrol/task/controller.dart';
import 'package:stone/pages/patrol/task/widgets/task_page_list.dart';

class TaskPage extends GetView<TaskController> {
  const TaskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: TaskPageList(),
    );
    // return const EventPageList();
  }
}
