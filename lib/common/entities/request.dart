/// 返回数据接收
class ResponseResult {
  int? code;
  String? msg;
  int? timestamp;
  dynamic data;

  ResponseResult({
    this.code,
    this.msg,
    this.timestamp,
    this.data,
  });

  factory ResponseResult.fromJson(Map<String, dynamic> json) => ResponseResult(
        code: json["code"] ?? 0,
        msg: json["msg"] ?? "",
        timestamp: json["timestamp"] ?? 0,
        data: json["data"],
      );
}

class RequestLoginParams {
  String? title;
  String ipv4Address;
  String username;
  String password;
  String commandPort;

  RequestLoginParams({
    this.title,
    required this.ipv4Address,
    required this.username,
    required this.password,
    required this.commandPort,
  });

  Map<String, dynamic> toJson() => {
        "title": title,
        "ipv4Address": ipv4Address,
        "username": username,
        "password": password,
        "commandPort": commandPort,
      };
}

class RequestDeviceInfoParams extends RequestLoginParams {
  RequestDeviceInfoParams({
    super.title,
    required super.ipv4Address,
    required super.username,
    required super.password,
    required super.commandPort,
  });
}
