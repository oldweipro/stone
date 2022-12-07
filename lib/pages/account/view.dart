import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stone/common/routers/routes.dart';
import 'package:stone/common/store/user.dart';
import 'package:stone/common/utils/mqtt.dart';
import 'package:stone/common/values/colors.dart';
import 'package:stone/common/widgets/widgets.dart';
import 'package:stone/pages/account/controller.dart';

class AccountPage extends GetView<AccountController> {
  const AccountPage({Key? key}) : super(key: key);

  Widget _button() {
    return btnFlatButtonWidget(
      onPressed: () {
        // 注销登录
        UserStore.to.onLogout();
        print(UserStore.to.isLogin);
        Get.offAndToNamed(AppRoutes.SIGN_IN);
      },
      gbColor: AppColors.primaryElement,
      title: "退出",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            _button(),
            // const Mqtt(setCode: 22,),
          ],
        ),
      ),
    );
  }
}
