import 'package:e_comerce_intern_nhat/src/model/product/productModel.dart';
import 'package:equatable/equatable.dart';

abstract class ProductEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadRequested extends ProductEvent {}

class UploadProducts extends ProductEvent {
  UploadProducts();
}
