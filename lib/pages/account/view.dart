import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stone/common/values/colors.dart';
import 'package:stone/common/widgets/button.dart';
import 'package:stone/common/widgets/widgets.dart';
import 'package:stone/pages/account/controller.dart';

class AccountPage extends GetView<AccountController> {
  const AccountPage({Key? key}) : super(key: key);

  Widget _button() {
    return btnFlatButtonWidget(
      onPressed: () {
        toastInfo(msg: "你点它干啥!");
      },
      gbColor: AppColors.primaryElement,
      title: "Sign in",
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
