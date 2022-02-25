import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;

  late FirebaseFirestore _firebaseFirestore;
  late FirebaseAuth _firebaseAuth;

  Future login(String username, String password) async {
    CollectionReference adminRef = _firebaseFirestore.collection('admin');

    try {
      isLoading.value = true;
      final user = adminRef.snapshots();

      user.forEach((element) {
        element.docs.forEach((element) {
          if (element.get('username') == username &&
              element.get('password') == password) {
            print('login success');
          } else {
            Get.snackbar('Error', 'Invalid Username or Password',
                snackPosition: SnackPosition.BOTTOM);
          }
        });
      });
    } catch (e) {
      print('Login Failed');

      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    _firebaseFirestore = FirebaseFirestore.instance;
    _firebaseAuth = FirebaseAuth.instance;
    super.onInit();
  }
}
