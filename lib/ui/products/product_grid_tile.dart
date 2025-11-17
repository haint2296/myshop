import 'package:flutter/material.dart';
import '../../models/product.dart';
import 'product_grid_footer.dart';

import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'products_manager.dart';
import '../cart/cart_manager.dart';

class ProductGridTile extends StatelessWidget {
  final Product product;

  const ProductGridTile({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: ProductGridFooter(
          product: product,
          onFavoritePressed: () => {
            context.read<ProductsManager>().updateProduct(
              product.copyWith(
                isFavorite: !product.isFavorite,
              ),
            ),
          },
          onAddToCartPressed: () {
            final cart = context.read<CartManager>();
            cart.addItem(product);

            ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text('Item added to cart'),
                duration: const Duration(seconds: 2),
                action: SnackBarAction(
                  label: 'Undo',
                  onPressed: () {
                    cart.removeItem(product.id!);
                  },
                ),
              ),
            );
          },
        ),
        child: GestureDetector(
          onTap: () {
            context.push('/products/${product.id}');
          },
          child: Image.network(product.imageUrl, fit: BoxFit.cover),
        ),
      ),
    );
  }
}
