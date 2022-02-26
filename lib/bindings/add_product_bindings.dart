import 'package:get/get.dart';
import 'package:shoping_admin_app/controller/add_product_controller.dart';

class AddProductBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<AddProductController>(AddProductController());
  }
}
