import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:get/get.dart';
import 'package:shoping_admin_app/controller/add_product_controller.dart';
import 'package:shoping_admin_app/controller/login_controller.dart';

import 'page/login.dart';
import 'routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
    GetMaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
      ),
      getPages: AppPages.pages,
      home: const MyApp(),
    ),
  );
}

class MyApp extends GetView<LoginController> {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: controller.streamController,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.data != null) {
          return const HomePage();
        } else {
          return const HomePage();
        }
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.toNamed(
            Routes.AddProductPage,
          );
        },
        label: const Text('Add Product'),
      ),
      appBar: AppBar(),
    );
  }
}
