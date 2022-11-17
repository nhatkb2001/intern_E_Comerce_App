import 'package:e_comerce_intern_nhat/src/model/product/productModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class CartState extends Equatable {}

class Loading extends CartState {
  @override
  List<Object?> get props => [];
}

class Success extends CartState {
  @override
  List<Object?> get props => [];
}

class Failed extends CartState {
  @override
  List<Object?> get props => [];
}

class ProductError extends CartState {
  final String error;

  ProductError(this.error);
  @override
  List<Object?> get props => [error];
}
