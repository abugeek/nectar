import 'package:flutter/material.dart';
import 'package:nectar/pages/productPages/cartPage.dart';
import 'package:nectar/pages/productPages/explorerPage.dart';
import 'package:nectar/pages/productPages/favoritePage.dart';
import 'package:nectar/pages/productPages/profilePage.dart';

import '../../pages/productPages/homePage.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentNavIndex = 0;
  final screens = [
    const HomePage(),
    const ExplorerPage(),
    const CartPage(),
    const FavoritePage(),
    const ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 16,
      borderRadius: BorderRadius.circular(15),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: SizedBox(
        height: 70,
        child: BottomNavigationBar(
          elevation: 0,
          currentIndex: _currentNavIndex,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/icons/home.png'),
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/icons/explorer.png'),
                ),
                label: 'Explorer'),
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/icons/cart.png'),
                ),
                label: 'Cart'),
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/icons/favorite.png'),
                ),
                label: 'Favorite'),
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/icons/profile.png'),
                ),
                label: 'Profile'),
          ],
        ),
      ),
      
    );
    
  }
  void _onItemTapped(int index) {
      setState(() {
        _currentNavIndex = index;
      });
    }
}
