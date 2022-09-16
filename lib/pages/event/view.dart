import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:stone/pages/event/controller.dart';
import 'package:stone/pages/event/widgets/event_page_list.dart';

class EventPage extends GetView<EventController> {
  const EventPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text("待开发...");
    // return const EventPageList();
  }
}
