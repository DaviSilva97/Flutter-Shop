import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/cart.dart';

import '../models/cart_item.dart';

class CartItemComponent extends StatelessWidget {
  final CartItem itemCart;

  const CartItemComponent(this.itemCart, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 15,
        ),
        Center(
          child: Container(
            margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey.shade300,
            ),
            height: 140,
            width: 385,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                    child: Image.network(
                      itemCart.product!.imageUrl,
                      height: 140,
                      width: 130,
                      fit: BoxFit.fill,
                    )),
                const SizedBox(
                  height: 140,
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          itemCart.name,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        IconButton(
                          onPressed: () {
                            Provider.of<Cart>(context, listen: false)
                                .removeItem(itemCart.productId);
                          },
                          icon: Icon(
                            Icons.delete,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        const SizedBox(
                          width: 90,
                        )
                      ],
                    ),
                    Text(
                      "Price: R\$ ${itemCart.price}",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Subtotal: ${itemCart.price * itemCart.quantity}",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Ships Free",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 40,
                            ),
                            InkWell(
                              onTap: () {
                                Provider.of<Cart>(context, listen: false)
                                    .decrementQuantity(itemCart.productId);
                              },
                              child: Container(
                                alignment: Alignment.center,
                                child: const Padding(
                                  padding: EdgeInsets.all(6.0),
                                  child: Icon(
                                    Icons.remove,
                                    color: Colors.red,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child:
                                    Text(itemCart.quantity.toStringAsFixed(0)),
                              ),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            InkWell(
                              onTap: () {
                                Provider.of<Cart>(context, listen: false)
                                    .incrementQuantity(itemCart.productId);
                              },
                              child: Container(
                                alignment: Alignment.center,
                                child: const Padding(
                                  padding: EdgeInsets.all(6.0),
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.green,
                                    size: 20,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
