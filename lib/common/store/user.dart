import 'dart:convert';

// import 'package:im_flutter_sdk/im_flutter_sdk.dart';
import 'package:stone/common/apis/apis.dart';
import 'package:stone/common/entities/entities.dart';
import 'package:stone/common/services/services.dart';
import 'package:stone/common/values/values.dart';
import 'package:get/get.dart';

class UserStore extends GetxController {
  static UserStore get to => Get.find();

  // 是否登录
  final _isLogin = false.obs;
  // 令牌 token
  String token = '';
  // 用户 profile
  final _profile = UserLoginResponseEntity().obs;

  bool get isLogin => _isLogin.value;
  UserLoginResponseEntity get profile => _profile.value;
  bool get hasToken => token.isNotEmpty;

  @override
  void onInit() {
    super.onInit();
    token = StorageService.to.getString(STORAGE_USER_TOKEN_KEY);
    if (token.isEmpty) {
      print("token已失效");
    } else {
      // TODO 在这里检查是否有缓存，如果有，则直接设置 profile，(还有isLogin暂时先写在这里，还没想好合适不)
      var profileOffline = StorageService.to.getString(STORAGE_USER_PROFILE_KEY);
      print("检查token: $token, 检查个人信息: $profileOffline");
      if (profileOffline.isNotEmpty) {
        _profile(UserLoginResponseEntity.fromJson(jsonDecode(profileOffline)));
        _isLogin(true);
      }
    }
  }

  // 保存 token
  Future<void> setToken(String value) async {
    await StorageService.to.setString(STORAGE_USER_TOKEN_KEY, value);
    token = value;
  }

  // 获取 profile
  Future<void> getProfile() async {
    if (token.isEmpty) return;
    var result = await UserAPI.profile();
    _profile(result);
    _isLogin.value = true;
    StorageService.to.setString(STORAGE_USER_PROFILE_KEY, jsonEncode(result));
  }

  // 保存 profile
  Future<void> saveProfile(UserLoginResponseEntity profile) async {
    _isLogin.value = true;
    StorageService.to.setString(STORAGE_USER_PROFILE_KEY, jsonEncode(profile));
  }

  // 注销
  Future<void> onLogout() async {
    // if (_isLogin.value) await UserAPI.logout();
    await StorageService.to.remove(STORAGE_USER_TOKEN_KEY);
    _isLogin.value = false;
    token = '';
    // EMClient.getInstance.logout();
  }
}
