import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';
import 'widgets/widgets.dart';

class MainPage extends GetView<MainController> {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Text("待开发"),
      // child: Column(
      //   children: <Widget>[
      //     // NewsCategoriesWidget(),
      //     const Divider(height: 1),
      //     // NewsRecommendWidget(),
      //     const Divider(height: 1),
      //     // NewsChannelsWidget(),
      //     const Divider(height: 1),
      //     // NewsListWidget(),
      //     const Divider(height: 1),
      //     // NewsletterWidget(),
      //   ],
      // ),
    );
  }
}
