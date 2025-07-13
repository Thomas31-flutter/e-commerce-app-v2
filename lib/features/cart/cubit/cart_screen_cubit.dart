import 'package:ecommercev2app/models/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../models/cart_model.dart';
import '../data/list_of_carts.dart';

//
// class CartScreenCubit extends Cubit<List<ProductModel>> {
//   CartScreenCubit() : super(listOfCarts);
//   addToCart(ProductModel product) {
//     if (!state.any((p) => p.id == product.id)) emit([...state, product]);
//   }
//
//   removeFromCart(ProductModel product) {
//     emit(state.where((p) => p.title != product.title).toList());
//   }
//
//   double get totalPrice => state.fold(0, (sum, item) => sum + item.price);
// }
class CartScreenCubit extends Cubit<List<CartItem>> {
  CartScreenCubit() : super([]);

  void addToCart(ProductModel product) {
    final existingIndex = state.indexWhere(
      (item) => item.product.id == product.id,
    );

    if (existingIndex != -1) {
      // المنتج موجود: زوّد الكمية
      final updated = state[existingIndex].copyWith(
        quantity: state[existingIndex].quantity + 1,
      );

      final newState = [...state];
      newState[existingIndex] = updated;
      emit(newState);
    } else {
      // منتج جديد
      emit([...state, CartItem(product: product, quantity: 1)]);
    }
  }

  void removeFromCart(ProductModel product) {
    emit(state.where((item) => item.product.id != product.id).toList());
  }

  double get totalPrice =>
      state.fold(0, (sum, item) => sum + (item.product.price * item.quantity));
}
