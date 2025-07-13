import 'package:ecommercev2app/models/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../models/product_model.dart';
import '../../cart/cubit/cart_screen_cubit.dart';

class CustomButtonAddToCart extends StatelessWidget {
  const CustomButtonAddToCart({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartScreenCubit, List<CartItem>>(
      builder: (context, cartItems) {
        return ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurple,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          onPressed: () {
            context.read<CartScreenCubit>().addToCart(product);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("added to cart successfully")),
            );
            Navigator.pushNamed(context, "cartscreen", arguments: product);
          },

          icon: Icon(Icons.shopping_cart_outlined, color: Colors.white),
          label: Text(
            "Add to Cart",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        );
      },
    );
  }
}
