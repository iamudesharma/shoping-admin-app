import 'package:get/get.dart';
import 'package:shoping_admin_app/bindings/add_product_bindings.dart';
import 'package:shoping_admin_app/controller/add_product_controller.dart';
import 'package:shoping_admin_app/main.dart';
import 'package:shoping_admin_app/page/add_product_page.dart';
import 'package:shoping_admin_app/page/login.dart';

 class Routes {
  static const INITIAL = '/';
  static const HOME = '/home';
  static const LOGIN = '/login';
  static const CADASTRO = '/cadastro';

  static const AddProductPage = '/add-Product';

  static const UpdateProductPage = '/update-Product';
}

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.HOME,
      page: () => const HomePage(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginPage(),
    ),

    GetPage(
      name: Routes.AddProductPage,
      page: () => const AddProductPage(),
      binding: AddProductBinding()
      
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginPage(),
    ),
  ];
}
