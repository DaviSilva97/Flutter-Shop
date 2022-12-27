import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/order.dart';

class OrderComponent extends StatefulWidget {
  final Order order;
  const OrderComponent({Key? key, required this.order}) : super(key: key);

  @override
  State<OrderComponent> createState() => _OrderComponentState();
}

class _OrderComponentState extends State<OrderComponent> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      children: [
        ListTile(
          title: Text('R\$ ${widget.order.total.toStringAsFixed(2)}'),
          subtitle:
              Text(DateFormat('dd/MM/yyyy hh:mm').format(widget.order.date)),
          trailing: IconButton(
            onPressed: () {
              setState(() {
                _expanded = !_expanded;
              });
            },
            icon: const Icon(Icons.expand_more),
          ),
        ),
        if (_expanded)
          Container(
              height: (widget.order.products.length * 25) + 10,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
              child: ListView(
                  children: widget.order.products.map((product) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      product.name,
                      style:
                          const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text('${product.quantity.toStringAsFixed(1)} x R\$ ${product.price}',
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey))
                  ],
                );
              }).toList()))
      ],
    ));
  }
}
