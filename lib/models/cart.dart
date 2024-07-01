import 'package:flutter/material.dart';
import 'product.dart';

class CartItem {
  final Product product;
  int quantity;

  CartItem({
    required this.product,
    this.quantity = 1,
  });
}

class Cart with ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  void addItem(Product product) {
    final index = _items.indexWhere((item) => item.product.id == product.id);
    if (index >= 0) {
      _items[index].quantity += 1;
    } else {
      _items.add(CartItem(product: product));
    }
    notifyListeners();
  }

  void incrementItem(CartItem cartItem) {
    cartItem.quantity += 1;
    notifyListeners();
  }

  void decrementItem(CartItem cartItem) {
    if (cartItem.quantity > 1) {
      cartItem.quantity -= 1;
    } else {
      _items.remove(cartItem);
    }
    notifyListeners();
  }

  double get totalAmount {
    return _items.fold(0.0, (sum, item) => sum + item.product.price * item.quantity);
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
