import 'package:flutter/material.dart';
// import 'package:im_flutter_sdk/im_flutter_sdk.dart';
import 'package:stone/common/apis/apis.dart';
import 'package:stone/common/entities/entities.dart';
import 'package:stone/common/routers/routes.dart';
import 'package:stone/common/store/store.dart';
import 'package:stone/common/utils/utils.dart';
import 'package:stone/common/widgets/widgets.dart';
import 'package:get/get.dart';

import 'index.dart';

class SignInController extends GetxController {
  final state = SignInState();

  SignInController();

  // email的控制器
  final TextEditingController emailController = TextEditingController();
  // 密码的控制器
  final TextEditingController passController = TextEditingController();

  // final MyRepository repository;
  // SignInController({@required this.repository}) : assert(repository != null);

  // 跳转 注册界面
  handleNavSignUp() {
    Get.toNamed(AppRoutes.SIGN_UP);
  }

  // 忘记密码
  handleFogotPassword() {
    toastInfo(msg: '忘记密码');
  }

  // 执行登录操作
  handleSignIn() async {
    // 输入框校验
    // if (!duIsEmail(_emailController.value.text)) {
    //   toastInfo(msg: '请正确输入邮件');
    //   return;
    // }
    // if (!duCheckStringLength(_passController.value.text, 6)) {
    //   toastInfo(msg: '密码不能小于6位');
    //   return;
    // }

    UserLoginRequestEntity params = UserLoginRequestEntity(
      email: emailController.value.text,
      password: duSHA256(passController.value.text),
    );
    // try {
    //   await EMClient.getInstance.login(emailController.value.text, passController.value.text);
    //   // TODO 如果登录成功跳转到主页面
    // } on EMError catch (e) {
    //   Loading.toast('登录失败 $e');
    // } finally {
    //   print("登录结果");
    // }

    UserLoginResponseEntity userProfile = await UserAPI.login(
      params: params,
    );
    if (userProfile.accessToken!.isNotEmpty) {
      UserStore.to.setToken(userProfile.accessToken!);
      UserStore.to.saveProfile(userProfile);
      print(UserStore.to.isLogin);
      Get.offAndToNamed(AppRoutes.Application);
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }
}
