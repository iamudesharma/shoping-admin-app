import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shoping_admin_app/controller/login_controller.dart';

import '../main.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterLogin(
        initialAuthMode: AuthMode.login,
        hideForgotPasswordButton: true,
        onLogin: (LoginData data) async {
          print('Login button pressed');
          print('Email: ${data.name}');
          print('Password: ${data.password}');
          FirebaseFirestore.instance
              .collection('Admin')
              .snapshots()
              .listen((_data) async {
            for (var doc in _data.docs) {
              print(doc.data()['Username']);
              print(doc.data()['password']);

              if (doc.data()['Username'] == data.name &&
                  doc.data()['password'] == data.password) {
                Get.to(HomePage());
                await FirebaseAuth.instance.signInAnonymously();
              } else {
                Get.snackbar('Error', 'Email or Password is incorrect',
                    snackPosition: SnackPosition.BOTTOM);
              }
            }
          });
          return null;
        },
        onRecoverPassword: (data) {},
      ),
    );
  }
}
