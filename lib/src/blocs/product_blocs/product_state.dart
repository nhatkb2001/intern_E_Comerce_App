import 'package:e_comerce_intern_nhat/src/model/product/productModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class ProductState extends Equatable {}

class Loading extends ProductState {
  @override
  List<Object?> get props => [];
}

class Success extends ProductState {
  @override
  List<ProductModel> productsList;
  Success(this.productsList);
  @override
  List<Object> get props => [productsList];
}

class Failed extends ProductState {
  @override
  List<Object?> get props => [];
}

class ProductError extends ProductState {
  final String error;

  ProductError(this.error);
  @override
  List<Object?> get props => [error];
}
