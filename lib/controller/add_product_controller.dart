import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:image_picker_web/image_picker_web.dart';
import 'package:shoping_admin_app/helper/firebase_helpers.dart';
import 'package:shoping_admin_app/model/product_model.dart';

class AddProductController extends GetxController {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseStorage _storage = FirebaseStorage.instance;

  // ImagePickerWeb _imagePicker = ImagePickerWeb();

  RxnString productImage = RxnString();
  RxnString imageFile = RxnString();

  TextEditingController productTextEditingController = TextEditingController();
  TextEditingController pirceTextEditingController = TextEditingController();
  TextEditingController productCategoryTextEditingController =
      TextEditingController();
  TextEditingController productIdTextEditingController =
      TextEditingController();
  TextEditingController productDescriptionTextEditingController =
      TextEditingController();

  CollectionReference productCollectionReference = FirebaseFirestore.instance
      .collection(FirebaseRef.productRef)
      .withConverter<ProductModel>(
          fromFirestore: (snapshot, options) => ProductModel.fromMap(
                snapshot.data()!,
              ),
          toFirestore: (document, options) => document.toMap());

  Future<void> getImage() async {
    ImagePicker imagePicker = ImagePicker();
    var image = await imagePicker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      productImage.value = String.fromCharCodes(await image.readAsBytes());

      await uploadFile(image);
    } else {
      print("image is null");
    }
  }

  Future<UploadTask?> uploadFile(XFile? file) async {
    if (file == null) {
      // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      //   content: Text('No file was selected'),
      // ));

      return null;
    }

    UploadTask uploadTask;

    // Create a Reference to the file
    Reference ref = FirebaseStorage.instance.ref().child('productimage/');

    final metadata = SettableMetadata(
      contentType: 'image/jpeg',
      customMetadata: {
        'picked-file-path': DateTime.now().microsecondsSinceEpoch.toString(),
      },
    );

    if (kIsWeb) {
      uploadTask = ref.putData(await file.readAsBytes(), metadata);
    } else {
      uploadTask = ref.putFile(File(file.path), metadata);
    }

    uploadTask.then((p0) async {
      print("uploaded");
      await p0.ref.getDownloadURL().then((value) => imageFile.value = value);

      // productImage.value = await p0.ref.getDownloadURL();
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
