import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:get/get.dart';
import 'package:shoping_admin_app/controller/login_controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterLogin(
        initialAuthMode: AuthMode.login,
        hideForgotPasswordButton: true,
        onLogin: (LoginData data) {
          controller.login(data.name, data.password);
        },
        onRecoverPassword: (data) {},
      ),
    );
  }
}
