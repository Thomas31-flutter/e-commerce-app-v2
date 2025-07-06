import 'package:ecommercev2app/features/favourite/data/favourites_data.dart';
import 'package:ecommercev2app/features/home/widgets/custome_favourite_icon.dart';
import 'package:ecommercev2app/models/product_model.dart';
import 'package:flutter/material.dart';

class CustomeProductCard extends StatefulWidget {
  const CustomeProductCard({
    super.key,
    required this.onTapToDetails,
    required this.productModel,
  });
  final void Function() onTapToDetails;
  final ProductModel productModel;
  // final bool isFavourite;
  // final VoidCallback onFavouritToggle;
  @override
  State<CustomeProductCard> createState() => _CustomeProductCardState();
}

class _CustomeProductCardState extends State<CustomeProductCard> {
  bool isActive = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTapToDetails,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).cardColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(2, 2),
              spreadRadius: 2,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: Image.network(
                      widget.productModel.image,
                      fit: BoxFit.cover,
                      height: 200,
                      width: 180,
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: CustomeFavouriteIcon(
                      active: isActive,
                      onTap: () {
                        setState(() {
                          isActive = !isActive;
                          if (isActive) {
                            favouritesProducts.add(widget.productModel);
                          } else {
                            favouritesProducts.removeWhere(
                              (element) =>
                                  element.title == widget.productModel.title,
                            );
                          }
                        });
                      },
                    ),
                  ),
                ],
              ),
              Text(
                widget.productModel.title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              Text(
                widget.productModel.description,
                style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                "\$ ${widget.productModel.price}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
