import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:get/get.dart';
import 'package:shoping_admin_app/controller/login_controller.dart';

import 'page/login.dart';

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
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const LoginPage();
  }
}
