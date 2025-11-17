import 'package:flutter/material.dart';
import 'products_grid.dart';
import '../cart/cart_manager.dart';

import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
enum FilterOptions {
  favorites,
  all,
}

class ProductsOverviewScreen extends StatefulWidget {
  const ProductsOverviewScreen({super.key});

  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _currentFilter = FilterOptions.all;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyShop'),
        actions: <Widget>[
          ProductFilerMenu(
            currentFilter: _currentFilter,
            onFilterSelected: (filter) {
              setState(() {
                _currentFilter = filter;
              });
            },
          ),
          ShoppingCartButton(
            onPressed: () {
              context.push('/cart');  
            },
          ),
        ]
      ),
      body: ProductsGrid(_currentFilter == FilterOptions.favorites),
    );
  }
}

class ProductFilerMenu extends StatelessWidget {
  const ProductFilerMenu({
    super.key,
    this.currentFilter,
    this.onFilterSelected,
  });
  final FilterOptions? currentFilter;
  final void Function(FilterOptions selectedValue)? onFilterSelected;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      initialValue: currentFilter,
      onSelected: onFilterSelected,
      icon: const Icon(Icons.more_vert),
      itemBuilder: (ctx) => [
        const PopupMenuItem(
          value: FilterOptions.favorites,
          child: Text('Only Favorites'),
        ),
        const PopupMenuItem(
          value: FilterOptions.all,
          child: Text('Show All'),
        ),
      ]
    );
  }
}

class ShoppingCartButton extends StatelessWidget {
  const ShoppingCartButton({super.key, this.onPressed});

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Consumer<CartManager>(
      builder: (_, cart, _) {
          return IconButton(
            icon: Badge.count(
              count: cart.productCount,
              child: const Icon(Icons.shopping_cart),
            ),
            onPressed: onPressed,
          );
        },
      );
  }
}
