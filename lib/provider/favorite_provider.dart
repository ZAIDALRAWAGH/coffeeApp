import 'package:coffee/Model/coffee_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteProvider extends ChangeNotifier {
  final List<Coffee> _favorite = [];
  List<Coffee> get favorite => _favorite;
  void toggleFavorite(Coffee coffee) {
    if (_favorite.contains(coffee)) {
      _favorite.remove(coffee);
    } else {
      _favorite.add(coffee);
    }
    notifyListeners();
  }

  bool isExist(Coffee product) {
    final isExist = _favorite.contains(product);
    return isExist;
  }

  static FavoriteProvider of(
    BuildContext context, {
    bool listen = true,
  }) {
    return Provider.of<FavoriteProvider>(
      context,
      listen: listen,
    );
  }
}
