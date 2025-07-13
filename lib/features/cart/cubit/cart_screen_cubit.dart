import 'package:ecommercev2app/models/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/list_of_carts.dart';

class CartScreenCubit extends Cubit<List<ProductModel>> {
  CartScreenCubit() : super(listOfCarts);
  addToCart(ProductModel product) {
    if (!state.any((p) => p.title == product.title)) emit([...state, product]);
  }

  removeFromCart(ProductModel product) {
    emit(state.where((p) => p.title != product.title).toList());
  }

  double get totalPrice => state.fold(0, (sum, item) => sum + item.price);
}
