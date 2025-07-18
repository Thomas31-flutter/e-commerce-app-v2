import 'package:ecommercev2app/models/product_model.dart';
import 'package:flutter/material.dart';
import '../widgets/custome_button_addtocart.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final productModel = ModalRoute.of(context)?.settings.arguments;
    if (productModel == null || productModel is! ProductModel) {
      return const Center(child: Text("No product found"));
    }
    final castedProduct = productModel as ProductModel;
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  child: Image.network(castedProduct.image, fit: BoxFit.cover),
                ),
              ),
              SizedBox(height: 100),
            ],
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.arrow_back_ios, size: 32),
                      color: Colors.black,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Text(
                    "Detail Product",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                  Icon(Icons.favorite_border, size: 32),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 400,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, -4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          castedProduct.title,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.remove_circle_outline),
                            onPressed: () {},
                          ),
                          Text("3"),
                          IconButton(
                            icon: Icon(Icons.add_circle_outline),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 6),
                  Text(
                    "Available in stock",
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Description",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    castedProduct.description,
                    style: TextStyle(color: Colors.grey[700], fontSize: 16),
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$ ${castedProduct.price}",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      CustomButtonAddToCart(product: castedProduct),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
