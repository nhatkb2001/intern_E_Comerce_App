import 'package:e_comerce_intern_nhat/src/model/product/productModel.dart';

abstract class BaseProductRepository {
  Future<List<ProductModel>> getAllProduct();
}
