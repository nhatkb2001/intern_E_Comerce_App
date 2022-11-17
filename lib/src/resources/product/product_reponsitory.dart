import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_comerce_intern_nhat/src/model/product/productModel.dart';
import 'package:e_comerce_intern_nhat/src/resources/product/baseProduct_reponsitory.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ProductRepository extends BaseProductRepository {
  @override
  Future<List<ProductModel>> getAllProduct() async {
    List<ProductModel> productList = [];
    try {
      final list =
          await FirebaseFirestore.instance.collection('products').get();
      list.docs.forEach((element) {
        return productList.add(ProductModel.fromDocument(element.data()));
      });
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print("Failed with error '${e.code}': '${e..message}'");
      }
      return productList;
    } catch (e) {
      throw Exception(e.toString());
    }
    return productList;
  }
}
