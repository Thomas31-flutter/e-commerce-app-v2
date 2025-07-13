import 'package:ecommercev2app/features/favourite/cubit/favourites_cubit.dart';
import 'package:ecommercev2app/features/favourite/data/favourites_data.dart';
import 'package:ecommercev2app/features/favourite/screens/favourite_screen.dart';
import 'package:ecommercev2app/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomeFavouriteIcon extends StatelessWidget {
  CustomeFavouriteIcon({super.key, required this.productModel});
  final ProductModel productModel;
  // @override
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouritesCubit, List<ProductModel>>(
      builder: (context, favouritesProducts) {
        final isFav = context.read<FavouritesCubit>().isFavourite(productModel);
        return GestureDetector(
          onTap: () {
            context.read<FavouritesCubit>().toggleFavourite(productModel);
          },
          child: isFav
              ? FaIcon(FontAwesomeIcons.solidHeart, size: 32, color: Colors.red)
              : FaIcon(FontAwesomeIcons.heart, size: 32),
        );
      },
    );
  }
}
