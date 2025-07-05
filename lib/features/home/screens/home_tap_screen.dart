import 'package:ecommercev2app/features/home/get_all_products_cubit/getallproductscubit.dart';
import 'package:ecommercev2app/features/home/widgets/custom_build_cubit_products.dart';
import 'package:ecommercev2app/features/home/widgets/custome_discount_card_pageview.dart';
import 'package:ecommercev2app/features/onboarding/widgets/custom_indicator.dart';
import 'package:ecommercev2app/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeTapScreen extends StatefulWidget {
  const HomeTapScreen({super.key});

  @override
  State<HomeTapScreen> createState() => _HomeTapScreenState();
}

class _HomeTapScreenState extends State<HomeTapScreen> {
  final PageController pageController = PageController();
  int currentIndex = 0;
  ProductModel? productModel;
  List<ProductModel> favourites = [];
  @override
  void initState() {
    super.initState();
    context.read<GetAllProductsCubit>().fetchAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Container(
              height: 210,
              child: PageView.builder(
                controller: pageController,
                onPageChanged: (value) {
                  currentIndex = value;
                  setState(() {});
                },
                itemCount: 3,
                itemBuilder: (context, index) {
                  return CustomeDiscountCardPageview();
                },
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomIndicator(active: currentIndex == 0),
                SizedBox(width: 10),
                CustomIndicator(active: currentIndex == 1),
                SizedBox(width: 10),
                CustomIndicator(active: currentIndex == 2),
              ],
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "New Arrifals 🔥",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                Text(
                  "See All",
                  style: TextStyle(color: Colors.blueAccent, fontSize: 18),
                ),
              ],
            ),
            CustomBuildCubitProducts(
              productModel:
                  productModel ??
                  ProductModel(
                    title: "title",
                    description: "description",
                    price: 0.00,
                    image: "assets/images/undraw_discount_igfl.png",
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
