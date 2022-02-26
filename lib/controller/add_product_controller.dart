import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:shoping_admin_app/helper/firebase_helpers.dart';
import 'package:shoping_admin_app/model/product_model.dart';

enum ImageType {
  Camera,
  Gallery,
}

class AddProductController extends GetxController {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseStorage _storage = FirebaseStorage.instance;

  ImagePickerWeb _imagePicker = ImagePickerWeb();

  RxnString productImage = RxnString();
  Rxn<File> imageFile = Rxn<File>();

  TextEditingController productTextEditingController = TextEditingController();
  TextEditingController pirceTextEditingController = TextEditingController();
  TextEditingController productCategoryTextEditingController =
      TextEditingController();
  TextEditingController productIdTextEditingController =
      TextEditingController();
  TextEditingController productDescriptionTextEditingController =
      TextEditingController();

  addProduct(ProductModel productModel, String id) async {
    CollectionReference productRef =
        _firestore.collection(FirebaseRef.productRef);

    await _firestore.doc(id).set(productModel.toMap());
  }

  Future<void> getImage() async {
    var image = await ImagePickerWeb.getImageAsBytes();

    if (image != null) {
      productImage.value = String.fromCharCodes(image);
      
      // await uploadFile(imageFile.value);
    } else {
      print("image is null");
    }
  }

  Future<UploadTask?> uploadFile(File? file) async {
    if (file == null) {
      // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      //   content: Text('No file was selected'),
      // ));

      return null;
    }

    UploadTask uploadTask;

    // Create a Reference to the file
    Reference ref = FirebaseStorage.instance.ref().child('product_image');

    final metadata = SettableMetadata(
      contentType: 'image/jpeg',
      customMetadata: {
        'picked-file-path': file.path,
      },
    );

    if (kIsWeb) {
      uploadTask = ref.putData(await file.readAsBytes(), metadata);
    } else {
      uploadTask = ref.putFile(File(file.path), metadata);
    }

    uploadTask.then((p0) async {
      print("uploaded");
      print(p0.ref.getDownloadURL());
      productImage.value = await p0.ref.getDownloadURL();
    });

    return Future.value(uploadTask);
  }

  @override
  void onInit() {
    super.onInit();
    productTextEditingController.addListener(() {
      productIdTextEditingController.text =
          productTextEditingController.text.toLowerCase();
    });
  }
}
