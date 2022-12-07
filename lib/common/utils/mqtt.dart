import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

class Mqtt extends StatefulWidget {
  final setCode;
  const Mqtt({this.setCode});

  @override
  State<Mqtt> createState() => _MqttState();
}

class _MqttState extends State<Mqtt> {
  MqttServerClient client = MqttServerClient.withPort(
      'mqtt.oldwei.com',
      'mqttx/rmjy/${DateTime.now().millisecondsSinceEpoch}/${Random().nextInt(100)}/floor1',
      1883);

  // mqtt，返的code，0：左上角（图片轮播）、1：左下角（视频轮播）、2：中间（座位分布图）、3：右侧（人员分组）、4：显示报警弹框、5：关闭报警弹框
  // mqtt，返的code，8：更新接口、5：显示报警弹框、6：关闭报警弹框
  dynamic code = '';
  // 应急预案图片列表
  List yuanImgList = [];

  // mqtt，返的code为advertiseBaseRefresh、advertiseJobRefresh，更新接口的mqtt
  dynamic updateCode = '';

  //初始化
  @override
  void initState() {
    //设置mqtt参连接相关参数
    client.onConnected = onConnected; //连接成功回调
    client.onDisconnected = onDisconnected; //连接断开回调
    client.onSubscribed = onSubscribed; //订阅成功回调
    client.onSubscribeFail = onSubscribeFail; //订阅失败回调
    // client.onUnsubscribed = onUnsubscribed; //取消订阅回调
    client.pongCallback = pong; //收到 PING 响应回调
    client.logging(on: false); //设置是否登陆
    // client.websocketProtocols = ['mqtt'];
    connect();
    //连接，这里不需要异步
    super.initState();
  }

  Future<MqttServerClient> connect() async {
    try {
      await client.connect();
      // Message();
    } catch (e) {
      print('Exception: $e');
      print('连接异常');
      client.disconnect();
    }
    return client;
  }

  // 连接成功
  void onConnected() {
    print('连接成功');
    Message();
  }

  // 连接断开
  void onDisconnected() {
    print('连接断开');
    showAlertDialog('mqtt未连接请重新打开');
    connect();
  }

  // 订阅主题成功
  void onSubscribed(String topic) {
    print('Subscribed topic: $topic');
  }

  // 订阅主题失败
  void onSubscribeFail(String topic) {
    print('Failed to subscribe $topic');
  }

  // 成功取消订阅
  void onUnsubscribed(String topic) {
    print('Unsubscribed topic: $topic');
  }

  // 收到 PING 响应
  void pong() {
    print('Ping response client callback invoked');
  }

  //消息监听
  void Message() async {
    //订阅主题
    client.subscribe("topic/hik", MqttQos.atLeastOnce);

    //监听消息
    client.updates?.listen((event) {
      // List<MqttReceivedMessage<MqttMessage?>>? c
      print("$event");
      // final message = event[0].payload as MqttPublishMessage;
      // final payload = Utf8Decoder().convert(message.payload.message);
      // setState(() {
      //   var data = json.decode(payload);
      //
      //   var dataCode = data['code'];
      //
      //   print('报警信息：${dataCode}');
      //   print('报警信息详情：${json.decode(payload)['msg']}');
      //
      //   if (dataCode == 'advertiseBaseRefresh' ||
      //       dataCode == 'advertiseJobRefresh') {
      //     updateCode = dataCode;
      //
      //     // 调用父级组件方法
      //     var data = json.decode(payload)['msg'];
      //     if (data != null) {
      //       widget.setCode(data);
      //     }
      //   } else {
      //     code = dataCode;
      //     updateCode = '';
      //
      //     // 应急预案报警
      //     if (code == 'emergencyRiskPush') {
      //       var urlList = data['msg']['fileList'];
      //       yuanImgList = [];
      //       urlList.forEach((item) {
      //         yuanImgList.add(
      //           Container(
      //             child: Image.network(
      //               item,
      //               fit: BoxFit.cover,
      //             ), //项目资源文件
      //           ),
      //         );
      //       });
      //     }
      //   }
      // });
      // // 子组件调用父组件中的方法
      // /*
      // * code：'advertiseBaseRefresh' || 'advertiseJobRefresh'：更新接口，5：显示报警弹框，6：关闭报警弹框
      // * code等于8时：url: advertiseBase（type：8（左上角，图片轮播），type：9（左下角，视频轮播），type：7（中间，座位分布图））、advertiseJob（右侧，人员分组）
      // * */
      // if (updateCode == 'advertiseBaseRefresh' || updateCode == 'advertiseJobRefresh') {
      //   // 调用父级组件方法
      //   // widget.setCode(code);
      //   var data = json.decode(payload)['data'];
      //   if (data != null) {
      //     widget.setCode(data);
      //   }
      // }
    });
  }

  //页面销毁时关闭连接
  @override
  void dispose() {
    client.onDisconnected!(); //断开连接
    super.dispose();
  }

  showAlertDialog(code) {
    //设置对话框
    AlertDialog alert = AlertDialog(
      title: Text(
        '警告',
        style: TextStyle(
          color: Colors.deepOrange,
        ),
      ),
      content: Text(code),
    );
  }

  // 报警弹框
  Widget giveAnAlarm() {
    return Scaffold(
      body: Stack(alignment: AlignmentDirectional.center, children: <Widget>[
        Positioned.fill(
          child: Container(
            color: Color.fromRGBO(13, 26, 65, 1),
          ),
        ),
        Positioned(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 报警图标
              Center(
                  child: Image.asset(
                    'assets/images/yichang.gif',
                    width: 80,
                    height: 80,
                  )),
              SizedBox(height: 16),
              // 报警信息
              Center(
                child: Column(
                  children: [
                    Text('剧院发生紧急状况，',
                        style: TextStyle(
                          color: Color.fromRGBO(243, 234, 26, 1),
                          fontFamily: 'YouSheBiaoTiHei',
                          fontSize: 32,
                        )),
                    Text('请观众及演职人员听从剧院工作人员指挥，',
                        style: TextStyle(
                          color: Color.fromRGBO(243, 234, 26, 1),
                          fontFamily: 'YouSheBiaoTiHei',
                          fontSize: 32,
                        )),
                    Text('从安全出口有序撤离。',
                        style: TextStyle(
                          color: Color.fromRGBO(243, 234, 26, 1),
                          fontFamily: 'YouSheBiaoTiHei',
                          fontSize: 32,
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }

  // 预案弹框
  Widget yuanModal() {
    var width = MediaQuery.of(context).size.height * 1.5;
    return Scaffold(
      body: Stack(alignment: AlignmentDirectional.center, children: <Widget>[
        Positioned.fill(
          child: Container(
            color: Color.fromRGBO(13, 26, 65, 1),
          ),
        ),
        Positioned(
          child: Center(
            child: Container(
              width: width,
              height: MediaQuery.of(context).size.height,
              child: Text("11111"),
            ),
          ),
        ),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    // return Center();
    return code == 'zxyunPush'
        ? giveAnAlarm()
        : (code == 'emergencyRiskPush'
        ? yuanModal()
        : (updateCode == ''
        ? Center()
        : (code == 'zxyunPush'
        ? giveAnAlarm()
        : (code == 'emergencyRiskPush' ? yuanModal() : Center()))));
  }
}
