import 'package:ecommercev2app/features/cart/cubit/cart_screen_cubit.dart';
import 'package:ecommercev2app/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomeListtileOfCartscreen extends StatelessWidget {
  const CustomeListtileOfCartscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productModel =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return BlocBuilder<CartScreenCubit, List<ProductModel>>(
      builder: (context, listOfCarts) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black45,
                blurRadius: 6,
                spreadRadius: 1,
                offset: Offset(2, 1),
              ),
            ],
          ),
          child: ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Image.network(productModel.image, fit: BoxFit.cover),
            ),
            title: Text(productModel.title),
            subtitle: Text(
              productModel.description,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: IconButton(
              onPressed: () {
                context.read<CartScreenCubit>().removeFromCart(productModel);
              },
              icon: Icon(Icons.delete),
            ),
          ),
        );
      },
    );
  }
}
