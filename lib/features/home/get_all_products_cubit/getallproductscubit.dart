import 'package:ecommercev2app/features/home/get_all_products_cubit/getallproductsstates.dart';
import 'package:ecommercev2app/models/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

class GetAllProductsCubit extends Cubit<AllProductsStates> {
  GetAllProductsCubit() : super(InitialAllProductsState());
  Future<void> fetchAllProducts() async {
    final dio = Dio();
    emit(LoadingAllProductsState());
    try {
      final res = await dio.get('https://dummyjson.com/products');
      List<dynamic> jsonData = res.data["products"];
      // print("response data :${res.data}");
      final List<ProductModel> products = [];
      for (var product in jsonData) {
        products.add(ProductModel.fromJson(product));
        // print("mapping success");
      }
      // print("Emmitted success : ${products.length}");
      if (res.statusCode == 200) {
        emit(SuccessAllProductsState(products));
      } else {
        emit(FailureAllProductsState("error message"));
      }
    } catch (e) {
      emit(FailureAllProductsState("$e"));
    }
  }
}
