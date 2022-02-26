import 'dart:convert';

class ProductModel {
  String name;
  String image;
  String pirce;
  String description;
  String category;
  String subCategory;
  String brand;
  ProductModel({
    required this.name,
    required this.image,
    required this.pirce,
    required this.description,
    required this.category,
    required this.subCategory,
    required this.brand,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'image': image,
      'pirce': pirce,
      'description': description,
      'category': category,
      'subCategory': subCategory,
      'brand': brand,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      name: map['name'] ?? '',
      image: map['image'] ?? '',
      pirce: map['pirce'] ?? '',
      description: map['description'] ?? '',
      category: map['category'] ?? '',
      subCategory: map['subCategory'] ?? '',
      brand: map['brand'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) => ProductModel.fromMap(json.decode(source));
}
