// import 'package:ecommercev2app/features/cart/cubit/cart_screen_cubit.dart';
// import 'package:ecommercev2app/features/main_layout/main_layout_bottomnavigationbar_screen.dart';
// import 'package:ecommercev2app/models/cart_model.dart';
// import 'package:ecommercev2app/models/product_model.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../../product_details/screens/product_details_screen.dart';
// import '../widgets/custome_listtile_of_cartscreen.dart';
//
// class CartScreen extends StatelessWidget {
//   const CartScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final productModel = ModalRoute.of(context)?.settings.arguments;
//     if (productModel == null || productModel is! ProductModel) {
//       return const Center(child: Text("No product found"));
//     }
//     final castedProduct = productModel as ProductModel;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Cart"),
//         centerTitle: true,
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pushAndRemoveUntil(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => BottomNavigationBarMainLayout(),
//               ),
//               (route) => false,
//             );
//           },
//           icon: Icon(Icons.arrow_back),
//         ),
//       ),
//       body: BlocBuilder<CartScreenCubit, List<CartItem>>(
//         builder: (context, cartItems) {
//           if (cartItems.isEmpty) {
//             return Center(
//               child: Text(
//                 "No items in the cart yet",
//                 style: TextStyle(fontSize: 24),
//               ),
//             );
//           } else {
//             return SafeArea(
//               child: Padding(
//                 padding: const EdgeInsets.all(16),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Expanded(
//                       child: ListView.separated(
//                         separatorBuilder: (context, index) =>
//                             SizedBox(height: 20),
//                         itemCount: cartItems.length,
//                         itemBuilder: (context, index) {
//                           return CustomeListtileOfCartscreen(
//                             productModel: castedProduct,
//                           );
//                         },
//                       ),
//                     ),
//
//                     SizedBox(height: 20),
//                     Text(
//                       "Total Price : \$ 350.50",
//                       style: TextStyle(fontSize: 20),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           }
//         },
//       ),
//     );
//   }
// }

import 'package:ecommercev2app/features/cart/cubit/cart_screen_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../models/cart_model.dart';
import '../widgets/custome_listtile_of_cartscreen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Cart")),
      body: BlocBuilder<CartScreenCubit, List<CartItem>>(
        builder: (context, cartItems) {
          if (cartItems.isEmpty) {
            return const Center(child: Text("Your cart is empty"));
          }

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cartItems.length,
                  itemBuilder: (context, index) {
                    final item = cartItems[index];

                    return CustomeListTileOfCartScreen(item: item);
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  boxShadow: const [
                    BoxShadow(color: Colors.black12, blurRadius: 8),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Total: ${context.read<CartScreenCubit>().totalPrice.toStringAsFixed(2)} EGP",
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Checkout not implemented."),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        "Checkout",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
