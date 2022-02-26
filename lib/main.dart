import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:get/get.dart';
import 'package:shoping_admin_app/controller/add_product_controller.dart';
import 'package:shoping_admin_app/controller/login_controller.dart';
import 'package:shoping_admin_app/model/product_model.dart';

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
        // brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.indigoAccent, brightness: Brightness.dark),
        useMaterial3: true,
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
          return HomePage();
        } else {
          return HomePage();
        }
      },
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Get.put<AddProductController>(AddProductController());

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
      body: StreamBuilder<QuerySnapshot<Object?>>(
          stream: controller.productCollectionReference.snapshots(),
          builder: (BuildContext context,
              AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
            var data = snapshot.data?.docs;

            if (data?.first.exists != null) {
              print(data!.length);
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('Error'),
              );
            } else if (snapshot.data!.docs.isEmpty) {
              return const Center(
                child: const Text('No Data'),
              );
            } else {
              return ListView.builder(
                itemCount: data?.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: data?.elementAt(0).get('image') != null
                        ? Image.network(data?.elementAt(0).get('image'))
                        : SizedBox.shrink(),
                    title: data?.elementAt(0).get('name') != null
                        ? Text(data?.elementAt(0).get('name'))
                        : Text('No Data'),
                  );
                },
              );
            }
          }),
    );
  }
}
