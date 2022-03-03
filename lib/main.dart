import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:get/get.dart';
import 'package:shoping_admin_app/controller/add_product_controller.dart';
import 'package:shoping_admin_app/controller/login_controller.dart';
import 'package:shoping_admin_app/model/product_model.dart';
import 'package:shoping_admin_app/page/add_product_page.dart';
import 'package:velocity_x/velocity_x.dart';

import 'page/home_page.dart';
import 'page/login.dart';
import 'routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Vx.setPathUrlStrategy();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyBsgrP6RSX6Kh2YtyptR5DqWfR_W0G98HI",
          authDomain: "shopingapp-3a842.firebaseapp.com",
          projectId: "shopingapp-3a842",
          storageBucket: "shopingapp-3a842.appspot.com",
          messagingSenderId: "797494043235",
          appId: "1:797494043235:web:2802154c2725a426d34e56",
          measurementId: "G-16M48V4P9E"));
  Get.put(LoginController());
  Get.put(() => AddProductController());

  runApp(
    const MyApp(),
  );
}

class MyApp extends GetView<LoginController> {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
      theme: ThemeData(),
      routerDelegate: vxNavigator,
      routeInformationParser: VxInformationParser(),
    );
  }
}
