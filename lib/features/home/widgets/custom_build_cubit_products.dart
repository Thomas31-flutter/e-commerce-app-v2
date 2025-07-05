import 'package:ecommercev2app/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../get_all_products_cubit/getallproductscubit.dart';
import '../get_all_products_cubit/getallproductsstates.dart';
import 'custome_product_card.dart';

class CustomBuildCubitProducts extends StatelessWidget {
  const CustomBuildCubitProducts({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllProductsCubit, AllProductsStates>(
      builder: (context, state) {
        print("current state : $state");
        if (state is LoadingAllProductsState) {
          return Center(child: CircularProgressIndicator());
        } else if (state is SuccessAllProductsState) {
          final List<ProductModel> products = state.products;
          return Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 16,
                childAspectRatio: 0.48,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return CustomeProductCard(
                  productModel: products[index],
                  onTapToDetails: () {
                    Navigator.pushNamed(
                      context,
                      "productdetailsscreen",
                      arguments: products[index],
                    );
                  },
                );
              },
            ),
          );
        } else if (state is FailureAllProductsState) {
          return Text("Error Loading data, please tyr again later");
        } else {
          return Container();
        }
      },
    );
  }
}
