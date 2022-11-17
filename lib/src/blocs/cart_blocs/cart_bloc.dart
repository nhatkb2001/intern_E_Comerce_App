import 'package:e_comerce_intern_nhat/src/blocs/cart_blocs/cart_events.dart';
import 'package:e_comerce_intern_nhat/src/blocs/cart_blocs/cart_state.dart';
import 'package:e_comerce_intern_nhat/src/resources/cart/cart_responsitory.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepository cartRepository;
  CartBloc({required this.cartRepository}) : super(Failed()) {
    on<LoadedCart>((event, emit) async {
      emit(Loading());
      try {
        final data = await cartRepository.LoadCart();
        emit(Success());
      } catch (e) {
        emit(ProductError(e.toString()));
        emit(Failed());
      }
    });
  }
}
