import 'package:cartify/constants/app_colors.dart';
import 'package:cartify/constants/app_sizes.dart';
import 'package:cartify/providers/navigation_provider.dart';
import 'package:cartify/screens/customer/cart_screen.dart';
import 'package:cartify/screens/customer/store_screen.dart';
import 'package:cartify/screens/customer/orders_screen.dart';
import 'package:cartify/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static final List<Widget> _pages = [
    const StoreScreen(),
    const CartScreen(),
    const OrdersScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final navProvider = Provider.of<NavigationProvider>(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: _pages[navProvider.currentIndex],
      bottomNavigationBar: NavigationBar(
        height: AppSizes.inputHeight,
        selectedIndex: navProvider.currentIndex,
        onDestinationSelected: navProvider.updateIndex,
        destinations: const [
          NavigationDestination(
            icon: Icon(size: AppSizes.iconM, Icons.storefront_outlined),
            selectedIcon: Icon(size: AppSizes.iconM, Icons.storefront_rounded),
            label: 'Store',
          ),
          NavigationDestination(
            icon: Icon(size: AppSizes.iconM, Icons.shopping_cart_outlined),
            selectedIcon: Icon(size: AppSizes.iconM, Icons.shopping_cart),
            label: 'Cart',
          ),
          NavigationDestination(
            icon: Icon(size: AppSizes.iconM, Icons.receipt_long_outlined),
            selectedIcon: Icon(size: AppSizes.iconM, Icons.receipt_long),
            label: 'Orders',
          ),
        ],
      ),
    );
  }
}
