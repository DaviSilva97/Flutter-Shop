import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/cart_item.dart';
import '../models/cart.dart';
import '../models/cart_item.dart';
import '../models/order_list.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<CartItem> cartItens = Provider.of<Cart>(context).itens;
    Cart cart = Provider.of<Cart>(context);

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Carrinho"),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cartItens.length,
                itemBuilder: (ctx, index) =>
                    CartItemComponent(cartItens[index]),
              ),
            ),
            Container(
              height: 80,
              color: Colors.grey.shade400,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: Text(
                          "Preço total: ",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "R\$${Provider.of<Cart>(context).totalValue.toStringAsFixed(2)}",
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Provider.of<OrderList>(context, listen: false)
                              .addOrder(cart);
                          cart.clear();
                        },
                        child: const Text(
                          "Fazer pedido",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
