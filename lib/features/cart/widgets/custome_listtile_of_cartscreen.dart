import 'package:ecommercev2app/features/cart/cubit/cart_screen_cubit.dart';
import 'package:ecommercev2app/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/cart_model.dart';

class CustomeListTileOfCartScreen extends StatelessWidget {
  const CustomeListTileOfCartScreen({super.key, required this.item});

  final CartItem item;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              // صورة المنتج
              CircleAvatar(
                radius: 35,
                backgroundImage: NetworkImage(item.product.image),
              ),

              const SizedBox(width: 12),

              // تفاصيل المنتج
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      item.product.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Quantity: ${item.quantity}",
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                  ],
                ),
              ),

              // السعر وحذف المنتج
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${(item.product.price * item.quantity).toStringAsFixed(2)} EGP",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, size: 22),
                    onPressed: () {
                      context.read<CartScreenCubit>().removeFromCart(
                        item.product,
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class CustomeListtileOfCartscreen extends StatelessWidget {
//   const CustomeListtileOfCartscreen({Key? key, required this.productModel});
//   final ProductModel productModel;
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<CartScreenCubit, List<CartItem>>(
//       builder: (context, listOfCarts) {
//         return Container(
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(24),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black45,
//                 blurRadius: 6,
//                 spreadRadius: 1,
//                 offset: Offset(2, 1),
//               ),
//             ],
//           ),
//           child: ListTile(
//             leading: ClipRRect(
//               borderRadius: BorderRadius.circular(24),
//               child: Image.network(productModel.image, fit: BoxFit.cover),
//             ),
//             title: Text(productModel.title),
//             subtitle: Text(
//               productModel.description,
//               overflow: TextOverflow.ellipsis,
//             ),
//             trailing: IconButton(
//               onPressed: () {
//                 context.read<CartScreenCubit>().removeFromCart(productModel);
//               },
//               icon: Icon(Icons.delete),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
