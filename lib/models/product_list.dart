import 'package:flutter/material.dart';
import 'package:shop/models/product.dart';
import '../data/mock_products_data.dart';

class ProductList with ChangeNotifier {
  final List<Product> _products = mockProducts;

  List<Product> get allItems {
    return [..._products];
  }

  List<Product> get favoriteItens {
    return allItems.where((element) => element.isFavorite).toList();
  }

  static Product getById(String productId) {
    return mockProducts.firstWhere((element) => element.id == productId);
  }
}
