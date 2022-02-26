import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:shoping_admin_app/controller/add_product_controller.dart';

import '../helper/textformfield_helper.dart';

class AddProductPage extends GetView<AddProductController> {
  const AddProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            minWidth: 400,
            maxWidth: 600,
            minHeight: 400,
            maxHeight: 600,
          ),
          child: Card(
            // color: Colors.black,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormHelpers.textFormFields(
                      controller: TextEditingController(),
                      label: 'Product Name',
                      hint: 'Enter The Product Name',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormHelpers.textFormFields(
                        controller: TextEditingController(),
                        label: 'Product Pirce',
                        hint: 'Enter The Product Price'),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormHelpers.textFormFields(
                        controller: TextEditingController(),
                        label: 'Product Description',
                        hint: 'Enter The Product Description'),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormHelpers.textFormFields(
                        controller: TextEditingController(),
                        label: 'Product Id',
                        hint: 'Enter The Product Id'),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormHelpers.textFormFields(
                      controller: TextEditingController(),
                      label: 'Product Category',
                      hint: 'Enter The Product Category,',
                    ),
                    Obx(() {
                      if (controller.productImage.value != null) {
                        return SizedBox(
                          height: 200,
                          width: 200,
                          child: Image.memory(
                            Uint8List.fromList(
                                controller.productImage.value!.codeUnits),
                          ),
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    }),
                    const SizedBox(
                      height: 10,
                    ),
                    Obx(() => controller.productImage.value == null
                        ? TextButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.add),
                            label: const Text('Add Product Images'),
                          )
                        : const SizedBox.shrink()),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton.icon(
                      onPressed: () async {
                        await controller.getImage();
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(double.infinity, 45),
                      ),
                      icon: Icon(Icons.add),
                      label: const Text('Add Product'),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
