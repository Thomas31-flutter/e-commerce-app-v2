import 'package:ecommercev2app/features/favourite/cubit/favourites_cubit.dart';
import 'package:ecommercev2app/features/favourite/data/favourites_data.dart';
import 'package:ecommercev2app/features/home/widgets/custome_product_card.dart';
import 'package:ecommercev2app/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<FavouritesCubit, List<ProductModel>>(
          builder: (context, favouritesProducts) {
            if (favouritesProducts.isEmpty) {
              return Center(
                child: Text(
                  "No favourites yet💔",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              );
            } else {
              return GridView.builder(
                padding: EdgeInsets.all(16),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.48,
                ),
                itemCount: favouritesProducts.length,
                itemBuilder: (context, index) {
                  return CustomeProductCard(
                    onTapToDetails: () {
                      Navigator.pushNamed(
                        context,
                        "productdetailsscreen",
                        arguments: favouritesProducts[index],
                      );
                    },
                    productModel: favouritesProducts[index],
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
