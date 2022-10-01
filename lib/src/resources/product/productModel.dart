import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class ProductModel {
  final String id;
  final String description;
  final String code;
  final String importPrice;
  final String price;
  final String type;
  final String link;
  final String name;
  final String quantity;
  final List images;
  ProductModel(
      {required this.id,
      required this.description,
      required this.code,
      required this.importPrice,
      required this.price,
      required this.type,
      required this.link,
      required this.name,
      required this.images,
      required this.quantity});

  factory ProductModel.fromDocument(Map<String, dynamic> doc) {
    return ProductModel(
        id: doc['id'],
        description: doc['description'],
        code: doc['code'],
        importPrice: doc['importPrice'],
        price: doc['price'],
        type: doc['type'],
        link: doc['link'],
        images: doc['images'],
        name: doc['name'],
        quantity: doc['quantity']);
  }
}
