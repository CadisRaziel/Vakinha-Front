// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProductModel {
  final int? id;
  final String? name;
  final String? description;
  final double? price;
  final String? image;

  ProductModel({
    this.id,
    this.name,
    this.description,
    this.price,
    this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "description": description,
      "price": price,
      "image": image,
    };
  }

  String toJson() => jsonEncode(toMap());

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map["id"] ?? 0,
      name: map["name"] ?? "",
      description: map["description"] ?? "",
      price: map["price"] ?? 0.0,
      image: map["image"] ?? "",
    );
  }

  factory ProductModel.fromJson(String json) =>
      ProductModel.fromMap(jsonDecode(json));

  @override
  String toString() {
    return 'ProductModel(id: $id, name: $name, description: $description, price: $price, image: $image)';
  }
}
