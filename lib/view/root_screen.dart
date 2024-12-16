import 'package:coffee/view/favorite_screen.dart';
import 'package:coffee/view/shopping_screen.dart';
import 'package:flutter/material.dart';

import '../colors.dart';
import 'home_screen.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _CoffeeAppMainScreenStateState();
}

class _CoffeeAppMainScreenStateState extends State<RootScreen> {
  int indexScreen = 0;

  List screens = [
    const HomeScreen(),
    const FavoriteScreen(),
    const ShoppingScreen(),
    const Center(
      child: Text(
        "Notifications",
        style: TextStyle(color: Colors.black),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens.elementAt(indexScreen),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: indexScreen,
          iconSize: 25,
          backgroundColor: xBackgroundColor,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: xPrimaryColor,
          selectedFontSize: 20,
          selectedLabelStyle:
              const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          onTap: (value) {
            setState(() {
              indexScreen = value;
            });
          },
          items: [
            BottomNavigationBarItem(
              backgroundColor: xPrimaryColor,
              label: "Home",
              icon: const Icon(Icons.home_outlined),
            ),
            BottomNavigationBarItem(
              backgroundColor: xPrimaryColor,
              label: "Favorite",
              icon: const Icon(Icons.favorite_border_outlined),
            ),
            BottomNavigationBarItem(
              backgroundColor: xPrimaryColor,
              label: "shopping",
              icon: const Icon(Icons.shopping_cart_outlined),
            ),
            BottomNavigationBarItem(
              backgroundColor: xPrimaryColor,
              label: "notifications",
              icon: const Icon(Icons.notifications_outlined),
            ),
          ]),
    );
  }
}
