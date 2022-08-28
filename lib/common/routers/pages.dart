import 'package:flutter/material.dart';
import 'package:stone/common/middlewares/middlewares.dart';
import 'package:stone/pages/account/bindings.dart';
import 'package:stone/pages/account/user/view.dart';
import 'package:stone/pages/account/view.dart';
import 'package:stone/pages/application/index.dart';
import 'package:stone/pages/category/index.dart';
import 'package:stone/pages/deatil/bindings.dart';
import 'package:stone/pages/deatil/view.dart';
import 'package:stone/pages/device/index.dart';
import 'package:stone/pages/event/bindings.dart';
import 'package:stone/pages/event/view.dart';
import 'package:stone/pages/frame/sign_in/index.dart';
import 'package:stone/pages/frame/sign_up/index.dart';
import 'package:stone/pages/frame/welcome/index.dart';
import 'package:get/get.dart';

import 'routes.dart';

class AppPages {
  static const INITIAL = AppRoutes.INITIAL;
  static final RouteObserver<Route> observer = RouteObservers();
  static List<String> history = [];

  static final List<GetPage> routes = [
    // 免登陆
    GetPage(
      name: AppRoutes.INITIAL,
      page: () => WelcomePage(),
      binding: WelcomeBinding(),
      middlewares: [
        RouteWelcomeMiddleware(priority: 1),
      ],
    ),
    GetPage(
      name: AppRoutes.SIGN_IN,
      page: () => const SignInPage(),
      binding: SignInBinding(),
    ),
    GetPage(
      name: AppRoutes.SIGN_UP,
      page: () => SignUpPage(),
      binding: SignUpBinding(),
    ),

    // 需要登录
    GetPage(
      name: AppRoutes.Application,
      page: () => const ApplicationPage(),
      binding: ApplicationBinding(),
      middlewares: [
        RouteAuthMiddleware(priority: 1),
      ],
    ),

    // 分类列表
    GetPage(
      name: AppRoutes.Category,
      page: () => const CategoryPage(),
      binding: CategoryBinding(),
    ),

    // 设备列表
    GetPage(
      name: AppRoutes.Device,
      page: () => const DevicePage(),
      binding: DeviceBinding(),
    ),

    GetPage(
      name: AppRoutes.DeviceDetail,
      page: () => const DeviceDetailPage(),
      binding: DeviceDetailBinding(),
    ),

    GetPage(
      name: AppRoutes.Event,
      page: () => const EventPage(),
      binding: EventBinding(),
    ),

    // 我的
    GetPage(
      name: AppRoutes.Account,
      page: () => const AccountPage(),
      binding: AccountBinding(),
      children: [
        GetPage(
          name: AppRoutes.User,
          page: () => const UserPage(),
        )
      ],
    ),
  ];

// static final unknownRoute = GetPage(
//   name: AppRoutes.NotFound,
//   page: () => NotfoundView(),
// );

}
