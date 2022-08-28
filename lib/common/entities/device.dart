/// 设备分页 request
class DevicePageListRequestEntity {
  String? keyword;
  int? pageNum;
  int? pageSize;

  DevicePageListRequestEntity({this.keyword, this.pageNum, this.pageSize});

  Map<String, dynamic> toJson() => {
        "pageNum": pageNum,
        "pageSize": pageSize,
      };
}

class DevicePageListResponseEntity {
  int? code;
  String? msg;
  int? counts;
  int? pagesize;
  int? pages;
  int? page;
  List<DeviceItem>? items;

  DevicePageListResponseEntity({
    this.code,
    this.msg,
    this.counts,
    this.pagesize,
    this.pages,
    this.page,
    this.items,
  });

  factory DevicePageListResponseEntity.fromJson(Map<String, dynamic> json) =>
      DevicePageListResponseEntity(
          code: json["code"],
          msg: json["msg"],
          counts: json["data"]["counts"],
          pagesize: json["data"]["pagesize"],
          pages: json["data"]["pages"],
          page: json["data"]["page"],
          items: json["data"]["items"] == null
              ? []
              : List<DeviceItem>.from(
                  json["data"]["items"].map((x) => DeviceItem.fromJson(x))));
}

class DeviceItem {
  String? types;
  String? deviceDescription;
  String? hcPlatformEnable;
  String? commandPort;
  int? digitalChannelNum;
  String? supportHcPlatform;
  String? dspVersion;
  String? ipv4Address;
  String? salt;
  String? activated;
  int? analogChannelNum;
  String? supportIpv6;
  String? passwordResetAbility;
  String? supportModifyIpv6;
  String? deviceLock;
  String? httpPort;
  String? dhcpAbility;
  String? deviceSn;
  DateTime? bootTime;
  String? mac;
  String? dhcp;
  String? encrypt;
  String? oemInfo;
  String? ipv4SubnetMask;
  String? deviceType;
  String? uuid;
  String? softwareVersion;
  String? ehomeVer;
  String? ipv4Gateway;
  String? supportEzvizUnbind;
  int? charEncodeType;
  int? loginId;
  String? username;
  String? password;
  String? title;
  bool? useAsync;
  int? alarmHandleId;
  int? previewHandleId;
  String? screenPicture;
  List<int>? analogChannelIds;
  List<int>? digitalChannelIds;
  List<int>? allChannelIds;

  DeviceItem({
    this.types,
    this.deviceDescription,
    this.hcPlatformEnable,
    this.commandPort,
    this.digitalChannelNum,
    this.supportHcPlatform,
    this.dspVersion,
    this.ipv4Address,
    this.salt,
    this.activated,
    this.analogChannelNum,
    this.supportIpv6,
    this.passwordResetAbility,
    this.supportModifyIpv6,
    this.deviceLock,
    this.httpPort,
    this.dhcpAbility,
    this.deviceSn,
    this.bootTime,
    this.mac,
    this.dhcp,
    this.encrypt,
    this.oemInfo,
    this.ipv4SubnetMask,
    this.deviceType,
    this.uuid,
    this.softwareVersion,
    this.ehomeVer,
    this.ipv4Gateway,
    this.supportEzvizUnbind,
    this.loginId,
    this.username,
    this.password,
    this.title,
    this.useAsync,
    this.alarmHandleId,
    this.previewHandleId,
    this.screenPicture,
    this.analogChannelIds,
    this.digitalChannelIds,
    this.allChannelIds,
  });

  factory DeviceItem.fromJson(Map<String, dynamic> json) => DeviceItem(
        types: json["types"],
        deviceDescription: json["deviceDescription"],
        hcPlatformEnable: json["hcPlatformEnable"],
        commandPort: json["commandPort"],
        digitalChannelNum: json["digitalChannelNum"],
        supportHcPlatform: json["supportHcPlatform"],
        dspVersion: json["dspVersion"],
        ipv4Address: json["ipv4Address"],
        salt: json["salt"],
        activated: json["activated"],
        analogChannelNum: json["analogChannelNum"],
        supportIpv6: json["supportIpv6"],
        passwordResetAbility: json["passwordResetAbility"],
        supportModifyIpv6: json["supportModifyIpv6"],
        deviceLock: json["deviceLock"],
        httpPort: json["httpPort"],
        dhcpAbility: json["dhcpAbility"],
        deviceSn: json["deviceSn"],
        bootTime: DateTime.parse(json["bootTime"]),
        mac: json["mac"],
        dhcp: json["dhcp"],
        encrypt: json["encrypt"],
        oemInfo: json["oemInfo"],
        ipv4SubnetMask: json["ipv4SubnetMask"],
        deviceType: json["deviceType"],
        uuid: json["uuid"],
        softwareVersion: json["softwareVersion"],
        ehomeVer: json["ehomeVer"],
        ipv4Gateway: json["ipv4Gateway"],
        supportEzvizUnbind: json["supportEzvizUnbind"],
        loginId: json["loginId"],
        username: json["username"],
        password: json["password"],
        title: json["title"],
        useAsync: json["useAsync"],
        alarmHandleId: json["alarmHandleId"],
        previewHandleId: json["previewHandleId"],
        screenPicture: json["screenPicture"],
        analogChannelIds: json["analogChannelIds"] == null
            ? []
            : List<int>.from(json["analogChannelIds"]),
        digitalChannelIds: json["digitalChannelIds"] == null
            ? []
            : List<int>.from(json["digitalChannelIds"]),
        allChannelIds: json["allChannelIds"] == null
            ? []
            : List<int>.from(json["allChannelIds"]),
      );

  Map<String, dynamic> toJson() => {
        "types": types,
        "deviceDescription": deviceDescription,
        "hcPlatformEnable": hcPlatformEnable,
        "commandPort": commandPort,
        "digitalChannelNum": digitalChannelNum,
        "supportHcPlatform": supportHcPlatform,
        "dspVersion": dspVersion,
        "ipv4Address": ipv4Address,
        "salt": salt,
        "activated": activated,
        "analogChannelNum": analogChannelNum,
        "supportIpv6": supportIpv6,
        "passwordResetAbility": passwordResetAbility,
        "supportModifyIpv6": supportModifyIpv6,
        "deviceLock": deviceLock,
        "httpPort": httpPort,
        "dhcpAbility": dhcpAbility,
        "deviceSn": deviceSn,
        "bootTime": bootTime?.toIso8601String(),
        "mac": mac,
        "dhcp": dhcp,
        "encrypt": encrypt,
        "oemInfo": oemInfo,
        "ipv4SubnetMask": ipv4SubnetMask,
        "deviceType": deviceType,
        "uuid": uuid,
        "softwareVersion": softwareVersion,
        "ehomeVer": ehomeVer,
        "ipv4Gateway": ipv4Gateway,
        "supportEzvizUnbind": supportEzvizUnbind,
        "loginId": loginId,
        "username": username,
        "password": password,
        "title": title,
        "useAsync": useAsync,
        "alarmHandleId": alarmHandleId,
        "previewHandleId": previewHandleId,
        "screenPicture": screenPicture,
        "analogChannelIds": analogChannelIds,
        "digitalChannelIds": digitalChannelIds,
        "allChannelIds": allChannelIds,
      };
}
