import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_comerce_intern_nhat/src/model/cart/cartItemModel.dart';

class CartModel {
  final String id;
  final String ownerId;
  List<CartItem> listItem = [];

  CartModel({this.id = "", this.ownerId = ""});

  factory CartModel.fromDocument(DocumentSnapshot doc) {
    return CartModel(
      id: doc.id,
      ownerId: doc['ownerId'],
    );
  }
}
