import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/app_drawer.dart';

import '../components/order.dart';
import '../models/order_list.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OrderList orders = Provider.of(context);
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text("Meus pedidos"),
      ),
      body: ListView.builder(
          itemCount: orders.itensCount,
          itemBuilder: (ctx, index) {
            return OrderComponent(order: orders.orders[index]);
          }),
    );
  }
}
