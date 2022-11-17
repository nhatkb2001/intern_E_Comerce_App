import 'package:equatable/equatable.dart';

abstract class CartEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadRequested extends CartEvent {}

class LoadedCart extends CartEvent {
  LoadedCart();
}
