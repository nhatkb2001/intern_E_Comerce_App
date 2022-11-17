import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_comerce_intern_nhat/src/model/cart/cartItemModel.dart';
import 'package:e_comerce_intern_nhat/src/model/cart/cartModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CartRepository {
  final id = FirebaseAuth.instance.currentUser!.uid.toString();
  @override
  Future<CartModel> LoadCart() async {
    CartModel cart = CartModel(id: '', ownerId: '');
    try {
      final list = await FirebaseFirestore.instance
          .collection('cart')
          .where('ownerId', isEqualTo: id)
          .get()
          .then((value) {
        return cart = CartModel.fromDocument(value.docs.first);
      });
    } on FirebaseException catch (e) {
      throw Exception(e.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
    return cart;
  }
}
