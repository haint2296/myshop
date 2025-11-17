import 'package:flutter/material.dart';
import '../../models/product.dart';
import 'product_grid_footer.dart';

import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'products_manager.dart';

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
          onAddToCartPressed: () => print('Add ${product.title} to cart'),
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
