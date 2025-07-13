import 'package:ecommercev2app/features/cart/cubit/cart_screen_cubit.dart';
import 'package:ecommercev2app/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/custome_listtile_of_cartscreen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cart"), centerTitle: true),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocBuilder<CartScreenCubit, List<ProductModel>>(
                builder: (context, ListOfCarts) {
                  if (ListOfCarts.isEmpty) {
                    return Center(
                      child: Text(
                        "No items in the cart yet",
                        style: TextStyle(fontSize: 24),
                      ),
                    );
                  } else {
                    return Expanded(
                      child: ListView.separated(
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 20),
                        itemCount: ListOfCarts.length,
                        itemBuilder: (context, index) {
                          return CustomeListtileOfCartscreen();
                        },
                      ),
                    );
                  }
                },
              ),
              SizedBox(height: 20),
              Text("Total Price : \$ 350.50", style: TextStyle(fontSize: 20)),
            ],
          ),
        ),
      ),
    );
  }
}
