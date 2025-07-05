import 'package:ecommercev2app/models/product_model.dart';

class AllProductsStates {}

class InitialAllProductsState extends AllProductsStates {}

class LoadingAllProductsState extends AllProductsStates {}

class SuccessAllProductsState extends AllProductsStates {
  final List<ProductModel> products;

  SuccessAllProductsState(this.products);
}

class FailureAllProductsState extends AllProductsStates {
  String errMsg;

  FailureAllProductsState(this.errMsg);
}
