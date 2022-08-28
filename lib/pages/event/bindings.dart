import 'package:get/get.dart';
import 'package:stone/pages/event/controller.dart';

class EventBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EventController>(() => EventController());
  }
}
