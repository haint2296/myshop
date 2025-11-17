import 'package:flutter/material.dart';
import '../../models/product.dart';
import 'product_grid_footer.dart';
import 'product_detail_screen.dart';

import 'package:go_router/go_router.dart';

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
          onFavoritePressed: () => print('Toggle favorite ${product.title}'),
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
