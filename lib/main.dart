import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/screens/cart.dart';
import 'package:shop/screens/orders.dart';
import 'package:shop/screens/products_details.dart';
import 'package:shop/screens/products_overview.dart';
import 'package:shop/utils/product_routes.dart';

import 'models/cart.dart';
import 'models/order_list.dart';
import 'models/product_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => ProductList()),
        ChangeNotifierProvider(create: (ctx) => Cart()),
        ChangeNotifierProvider(create: (ctx) => OrderList())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shop',
        theme: ThemeData(
            primarySwatch: Colors.purple,
            colorScheme: ColorScheme.fromSwatch()
                .copyWith(primary: Colors.purple, secondary: Colors.deepOrange),
            fontFamily: 'Lato'),
        routes: {
          ProductRoutes.HOME: (context) => const ProductsOverview(),
          ProductRoutes.PRODUCT_DETAIL: (context) => const ProductDetail(),
          ProductRoutes.CART: (context) => const CartScreen(),
          ProductRoutes.ORDERS: (context) => const OrderScreen()
        },
      ),
    );
  }
}
