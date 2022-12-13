// 注册请求
class UserRegisterRequestEntity {
  String email;
  String password;

  UserRegisterRequestEntity({
    required this.email,
    required this.password,
  });

  factory UserRegisterRequestEntity.fromJson(Map<String, dynamic> json) =>
      UserRegisterRequestEntity(
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
    "email": email,
    "password": password,
  };
}

// 登录请求
class UserLoginRequestEntity {
  String email;
  String password;

  UserLoginRequestEntity({
    required this.email,
    required this.password,
  });

  factory UserLoginRequestEntity.fromJson(Map<String, dynamic> json) =>
      UserLoginRequestEntity(
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
    "email": email,
    "password": password,
  };
}

// 登录返回
class UserLoginResponseEntity {
  int? code;
  dynamic data;
  String? msg;

  UserLoginResponseEntity({
    this.code,
    this.data,
    this.msg,
  });

  factory UserLoginResponseEntity.fromJson(Map<String, dynamic> json) =>
      UserLoginResponseEntity(
        code: json["code"],
        data: json["data"],
        msg: json["msg"],
      );

  Map<String, dynamic> toJson() => {
    "code": code,
    "data": data,
    "msg": msg,
  };
}
