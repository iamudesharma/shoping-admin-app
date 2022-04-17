import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoping_admin_app/bindings/add_product_bindings.dart';
import 'package:shoping_admin_app/controller/add_product_controller.dart';
import 'package:shoping_admin_app/main.dart';
import 'package:shoping_admin_app/page/add_product_page.dart';
import 'package:shoping_admin_app/page/login.dart';
import 'package:shoping_admin_app/page/notifitions_page.dart';
import 'package:shoping_admin_app/page/order_page.dart';
import 'package:shoping_admin_app/page/users_page.dart';
import 'package:velocity_x/velocity_x.dart';

import '../page/home_page.dart';
import '../page/product_page.dart';

class Routes {
  static const HOME = '/';
  static const LOGIN = '/login';
  static const AddProductPage = '/add-Product';
  static const UpdateProductPage = '/update-Product';
  static const ProductPage = '/Product';
  static const UserPage = '/users';
  static const OrderPage = '/orders';
  static const Notifications = '/notifications';
 }

final vxNavigator = VxNavigator(
  routes: {
   '/': (uri, param) => MaterialPage(child: HomePage()),
    Routes.LOGIN: (uri, param) => const MaterialPage(child: LoginPage()),
    Routes.AddProductPage: (uri, param) => const MaterialPage(
          child: AddProductPage(),
        ),
    '/notifications': (uri, param) => const MaterialPage(
          child: NotificationsPage(),
        ),
    Routes.OrderPage: (uri, param) => const MaterialPage(
          child: OrdersPage(),
        ),
    Routes.UserPage: (uri, param) => const MaterialPage(
          child: UsersPage(),
        ),
    Routes.ProductPage: (uri, param) => MaterialPage(
          child: ProductPage(),
        ),
  },
  observers: [
    MyObs(),
  ],

);

class MyObs extends VxObserver {
  @override
  void didChangeRoute(Uri route, Page page, String pushOrPop) {
    print("${route.path} - $pushOrPop");
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    print('Pushed a route');
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    print('Popped a route');
  }
}

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginPage(),
    ),
    GetPage(
        name: Routes.AddProductPage,
        page: () => const AddProductPage(),
        binding: AddProductBinding()),
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginPage(),
    ),
  ];
}
