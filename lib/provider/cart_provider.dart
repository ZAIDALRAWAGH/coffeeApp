import 'package:coffee/Model/coffee_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartProvider extends ChangeNotifier {
  final List<Coffee> _cart = [];
  List<Coffee> get cart => _cart;
  void toggleFavorite(Coffee coffee) {
    if (_cart.contains(coffee)) {
      for (Coffee element in _cart) {
        element.quantity++;
      }
    } else {
      _cart.add(coffee);
    }
    notifyListeners();
  }

  incrementQth(int index) => _cart[index].quantity++;
  decrementQth(int index) => _cart[index].quantity--;

  totalPrice() {
    double total1 = 0.0;
    for (Coffee element in _cart) {
      total1 += element.price * element.quantity;
    }
    return total1;
  }

  static CartProvider of(
    BuildContext context, {
    bool listen = true,
  }) {
    return Provider.of<CartProvider>(
      context,
      listen: listen,
    );
  }
}
