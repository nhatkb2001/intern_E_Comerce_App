import 'package:e_comerce_intern_nhat/src/blocs/product_blocs/product_events.dart';
import 'package:e_comerce_intern_nhat/src/blocs/product_blocs/product_state.dart';
import 'package:e_comerce_intern_nhat/src/resources/product/product_reponsitory.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository productRepository;
  ProductBloc({required this.productRepository}) : super(Failed()) {
    on<UploadProducts>((event, emit) async {
      emit(Loading());
      try {
        final data = await productRepository.getAllProduct();
        emit(Success(data));
      } catch (e) {
        emit(ProductError(e.toString()));
        emit(Failed());
      }
    });
  }
}
