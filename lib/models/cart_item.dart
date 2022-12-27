import 'package:shop/models/product.dart';
import 'package:shop/models/product_list.dart';

class CartItem {
  String id;
  String productId;
  String name;
  double price;
  double quantity;
  Product? product;

  CartItem({
    required this.id,
    required this.productId,
    required this.name,
    required this.price,
    required this.quantity,
  }) {
    product = ProductList.getById(productId);
  }
}
