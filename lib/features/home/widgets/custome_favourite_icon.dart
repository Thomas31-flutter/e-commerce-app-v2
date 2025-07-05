import 'package:ecommercev2app/features/favourite/data/favourites_data.dart';
import 'package:ecommercev2app/features/favourite/screens/favourite_screen.dart';
import 'package:ecommercev2app/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomeFavouriteIcon extends StatefulWidget {
  CustomeFavouriteIcon({super.key, required this.active, required this.onTap});
  bool active;
  final void Function() onTap;
  ProductModel? productModel;
  @override
  State<CustomeFavouriteIcon> createState() => _CustomeFavouriteIconState();
}

class _CustomeFavouriteIconState extends State<CustomeFavouriteIcon> {
  @override
  void initState() {
    super.initState();
    widget.active = favouritesProducts.any(
      (element) => element.title == widget.productModel?.title,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: widget.active
          ? FaIcon(FontAwesomeIcons.solidHeart, size: 32, color: Colors.red)
          : FaIcon(FontAwesomeIcons.heart, size: 32),
    );
  }
}
