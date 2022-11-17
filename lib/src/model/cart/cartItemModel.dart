import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class CartItem {
  final String id;
  final String name;
  final String description;
  final String image;
  final String options;
  final String unit_price;
  final String quantity;

  CartItem({
    this.id = "",
    this.name = "",
    this.description = "",
    this.image = "",
    this.options = "",
    this.unit_price = "",
    this.quantity = "",
  });

  factory CartItem.fromDocument(DocumentSnapshot doc) {
    return CartItem(
      id: doc.id,
      name: doc['name'],
      description: doc['description'],
      image: doc['image'],
      options: doc['options'],
      unit_price: doc['unit price'],
      quantity: doc['quantity'],
    );
  }
}
