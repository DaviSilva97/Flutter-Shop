import 'dart:math';

import 'package:flutter/material.dart';

import 'cart.dart';
import 'order.dart';

class OrderList with ChangeNotifier {
  final List<Order> _orders = [];

  List<Order> get orders {
    return [..._orders];
  }

  int get itensCount {
    return _orders.length;
  }

  void addOrder(Cart cart) {
    _orders.insert(
      0,
      Order(
          id: Random().nextDouble().toString(),
          total: cart.totalValue,
          products: cart.itens,
          date: DateTime.now()),
    );

    notifyListeners();
  }
}
