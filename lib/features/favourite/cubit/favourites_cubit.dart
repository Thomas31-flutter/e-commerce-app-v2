import 'package:ecommercev2app/models/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/favourites_data.dart';

class FavouritesCubit extends Cubit<List<ProductModel>> {
  FavouritesCubit() : super(favouritesProducts);

  toggleFavourite(ProductModel product) {
    final isAlreadyFav = state.any((p) => p.title == product.title);
    if (isAlreadyFav) {
      emit(state.where((p) => p.title != product.title).toList());
    } else {
      emit([...state, product]);
    }
  }

  bool isFavourite(ProductModel product) {
    return state.any((p) => p.title == product.title);
  }
}
