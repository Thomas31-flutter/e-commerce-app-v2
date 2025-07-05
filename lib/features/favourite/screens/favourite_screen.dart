import 'package:ecommercev2app/features/favourite/data/favourites_data.dart';
import 'package:ecommercev2app/features/home/widgets/custome_product_card.dart';
import 'package:flutter/material.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: favouritesProducts.isEmpty
          ? Center(
              child: Text(
                "No Favourites Yet !",
                style: TextStyle(fontSize: 40),
              ),
            )
          : SafeArea(
              child: GridView.builder(
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
              ),
            ),
    );
  }
}
