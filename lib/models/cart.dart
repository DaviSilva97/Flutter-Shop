import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shop/models/cart_item.dart';

import 'product.dart';

class Cart with ChangeNotifier {
  final Map<String, CartItem> _itens = {};

  List<CartItem> get itens {
    return _itens.values.toList();
  }

  void addItem(Product product) {
    if (_itens.containsKey(product.id)) {
      incrementQuantity(product.id);
    } else {
      _itens.putIfAbsent(
        product.id,
        () => CartItem(
            id: Random().nextDouble.toString(),
            productId: product.id,
            name: product.name,
            price: product.price,
            quantity: 1),
      );
      notifyListeners();
    }
  }

  void clear() {
    _itens.clear();
    notifyListeners();
  }

  double get totalValue {
    double total = 0.0;

    _itens.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });

    return total;
  }

  void removeItem(String productId) {
    _itens.remove(productId);
    notifyListeners();
  }

  int get itensCount {
    return _itens.length;
  }

  void incrementQuantity(String productId) {
    if (_itens.containsKey(productId)) {
      _itens.update(
          productId,
          (existentItem) => CartItem(
              id: existentItem.id,
              productId: existentItem.productId,
              name: existentItem.name,
              price: existentItem.price,
              quantity: existentItem.quantity += 1));
    }
    notifyListeners();
  }

  void decrementQuantity(String productId) {
    if (_itens.containsKey(productId)) {
      if (haveQuantityGreaterThenOne(productId)) {
        _itens.update(
            productId,
            (existentItem) => CartItem(
                id: existentItem.id,
                productId: existentItem.productId,
                name: existentItem.name,
                price: existentItem.price,
                quantity: existentItem.quantity -= 1));
      } else {
        removeItem(productId);
      }
    }

    notifyListeners();
  }

  bool haveQuantityGreaterThenOne(productId) {
    bool haveQuantityGreaterThenOne = false;
    if (_itens.containsKey(productId)) {
      _itens.forEach((key, value) {
        if ((key == productId) && value.quantity > 1) {
          haveQuantityGreaterThenOne = true;
        }
      });
    }
    return haveQuantityGreaterThenOne;
  }
}
