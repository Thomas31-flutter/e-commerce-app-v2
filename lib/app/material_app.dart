import 'package:ecommercev2app/core/notifier/theme_notifier.dart';
import 'package:ecommercev2app/features/home/get_all_products_cubit/getallproductscubit.dart';
import 'package:ecommercev2app/features/login/screens/login_screen.dart';
import 'package:ecommercev2app/features/main_layout/main_layout_bottomnavigationbar_screen.dart';
import 'package:ecommercev2app/features/product_details/screens/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../features/cart/cubit/cart_screen_cubit.dart';
import '../features/cart/screens/cart_screen.dart';
import '../features/favourite/cubit/favourites_cubit.dart';
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
        BlocProvider<CartScreenCubit>(create: (context) => CartScreenCubit()),
        BlocProvider<FavouritesCubit>(create: (context) => FavouritesCubit()),
        BlocProvider<LoginCubit>(create: (context) => LoginCubit()),
        BlocProvider<GetAllProductsCubit>(
          create: (context) => GetAllProductsCubit(),
        ),
      ],
      child: ValueListenableBuilder<ThemeMode>(
        valueListenable: themeNotifier,
        builder: (context, currentTheme, child) {
          return MaterialApp(
            theme: ThemeData(
              brightness: Brightness.light,
              scaffoldBackgroundColor: Colors.white,
              cardColor: Colors.white,
              iconTheme: const IconThemeData(color: Colors.black),
              textTheme: const TextTheme(
                bodyLarge: TextStyle(color: Colors.black),
              ),
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              scaffoldBackgroundColor: const Color(0xFF121212),
              cardColor: const Color(0xFF1E1E1E),
              iconTheme: const IconThemeData(color: Colors.white),
              textTheme: const TextTheme(
                bodyLarge: TextStyle(color: Colors.white),
              ),
            ),

            themeMode: currentTheme,
            routes: {
              "productdetailsscreen": (context) => ProductDetailsScreen(),
              "cartscreen": (context) => CartScreen(),
            },
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
          );
        },
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
//         BlocProvider<CartScreenCubit>(create: (context) => CartScreenCubit()),
//         BlocProvider<FavouritesCubit>(create: (context) => FavouritesCubit()),
//         BlocProvider<LoginCubit>(create: (context) => LoginCubit()),
//         BlocProvider<GetAllProductsCubit>(
//           create: (context) => GetAllProductsCubit(),
//         ),
//       ],
//       child: ValueListenableBuilder<ThemeMode>(
//         valueListenable: themeNotifier,
//         builder: (context, currentTheme, child) {
//           return MaterialApp(
//             theme: ThemeData(
//               brightness: Brightness.light,
//               scaffoldBackgroundColor: Colors.white,
//               cardColor: Colors.white,
//               iconTheme: const IconThemeData(color: Colors.black),
//               textTheme: const TextTheme(
//                 bodyLarge: TextStyle(color: Colors.black),
//               ),
//             ),
//             darkTheme: ThemeData(
//               brightness: Brightness.dark,
//               scaffoldBackgroundColor: const Color(0xFF121212),
//               cardColor: const Color(0xFF1E1E1E),
//               iconTheme: const IconThemeData(color: Colors.white),
//               textTheme: const TextTheme(
//                 bodyLarge: TextStyle(color: Colors.white),
//               ),
//             ),
//
//             themeMode: currentTheme,
//             routes: {
//               "productdetailsscreen": (context) => ProductDetailsScreen(),
// "cartscreen": (context) => CartScreen(),
//             },
//             debugShowCheckedModeBanner: false,
//             home: SplashScreen(),
//           );
//         },
//       ),
//     );
//   }
// }
