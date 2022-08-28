import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stone/common/values/colors.dart';
import 'package:stone/common/widgets/button.dart';
import 'package:stone/pages/account/user/controller.dart';

class UserPage extends GetView<UserController> {
  const UserPage({Key? key}) : super(key: key);

  Widget _button() {
    return btnFlatButtonWidget(
      onPressed: controller.tiaozhuan,
      gbColor: AppColors.primaryElement,
      title: "跳转了",
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _button(),
      ),
    );
  }
}
