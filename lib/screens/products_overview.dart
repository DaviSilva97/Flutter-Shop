import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/app_drawer.dart';
import '../components/badge.dart';
import '../components/product_grid.dart';
import '../models/cart.dart';
import '../utils/product_routes.dart';

enum FilterOptions { onlyFavorites, allProducts }

class ProductsOverview extends StatefulWidget {
  const ProductsOverview({Key? key}) : super(key: key);

  @override
  State<ProductsOverview> createState() => _ProductsOverviewState();
}

class _ProductsOverviewState extends State<ProductsOverview> {
  bool _showFavoriteOnly = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text("Minha loja"),
        centerTitle: true,
        actions: [
          PopupMenuButton(
            itemBuilder: (_) => [
              const PopupMenuItem(
                value: FilterOptions.onlyFavorites,
                child: Text('Somente Favoritos'),
              ),
              const PopupMenuItem(
                value: FilterOptions.allProducts,
                child: Text('Todos'),
              )
            ],
            onSelected: (FilterOptions selected) {
              setState(() {
                if (selected == FilterOptions.allProducts) {
                  _showFavoriteOnly = false;
                } else {
                  _showFavoriteOnly = true;
                }
              });
            },
          ),
          Consumer<Cart>(
            builder: (context, value, child) => Badge(
              value: value.itensCount.toString(),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(ProductRoutes.CART);
                },
                icon: const Icon(Icons.shopping_cart),
              ),
            ),
          )
        ],
      ),
      body: ProductGrid(_showFavoriteOnly),
    );
  }
}
