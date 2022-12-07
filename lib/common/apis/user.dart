import 'package:stone/common/entities/entities.dart';
import 'package:stone/common/utils/utils.dart';

/// 用户
class UserAPI {
  /// 登录
  static Future<UserLoginResponseEntity> login({
    UserLoginRequestEntity? params,
  }) async {
    var response = await HttpUtil().post(
      '/user/login',
      data: params?.toJson(),
    );
    return UserLoginResponseEntity.fromJson(response);
  }

  /// 注册
  static Future<UserRegisterRequestEntity> register({
    UserRegisterRequestEntity? params,
  }) async {
    var response = await HttpUtil().post(
      '/user/register',
      data: params?.toJson(),
    );
    return UserRegisterRequestEntity.fromJson(response);
  }

  /// Profile
  static Future<UserLoginResponseEntity> profile() async {
    var response = await HttpUtil().post(
      '/user/profile',
    );
    // return UserLoginResponseEntity.fromJson(response);
    return UserLoginResponseEntity(
        accessToken: "accessToken",
        displayName: "老卫同学",
        channels: [
          "gogoo",
          "aaaa"
        ]
    );
  }

  /// Logout
  static Future logout() async {
    return await HttpUtil().post(
      '/user/logout',
    );
  }
}
