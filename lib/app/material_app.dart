import 'package:ecommercev2app/features/home/get_all_products_cubit/getallproductscubit.dart';
import 'package:ecommercev2app/features/login/screens/login_screen.dart';
import 'package:ecommercev2app/features/main_layout/main_layout_bottomnavigationbar_screen.dart';
import 'package:ecommercev2app/features/product_details/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../features/login/cubit/login_cubit.dart';
import '../features/splash/screens/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  Future<bool> hasToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");
    return token != null && token.isNotEmpty;
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>(create: (context) => LoginCubit()),
        BlocProvider<GetAllProductsCubit>(
          create: (context) => GetAllProductsCubit(),
        ),
      ],
      child: MaterialApp(
        routes: {"productdetailsscreen": (context) => ProductDetailsScreen()},
        debugShowCheckedModeBanner: false,
        home: FutureBuilder(
          future: hasToken(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else {
              if (snapshot.data == true) {
                return BottomNavigationBarMainLayout();
              } else {
                return LoginScreen();
              }
            }
          },
        ),
      ),
    );
  }
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider<LoginCubit>(create: (context) => LoginCubit()),
//         BlocProvider<GetAllProductsCubit>(
//           create: (context) => GetAllProductsCubit(),
//         ),
//       ],
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home: SplashScreen(),
//       ),
//     );
//   }
// }
