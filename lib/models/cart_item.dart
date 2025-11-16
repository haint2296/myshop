import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String title;
  final String imageUrl;
  final int quantity;
  final double price;
  final Color? selectedColor;
  final String? selectedSize;

  CartItem({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.quantity,
    required this.price,
    this.selectedColor,
    this.selectedSize,
  });

  CartItem copyWith({
    String? id,
    String? title,
    String? imageUrl,
    int? quantity,
    double? price,
    Color? selectedColor,
    String? selectedSize,
  }) {
    return CartItem(
      id: id ?? this.id,
      title: title ?? this.title,
      imageUrl: imageUrl ?? this.imageUrl,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
      selectedColor: selectedColor ?? this.selectedColor,
      selectedSize: selectedSize ?? this.selectedSize,
    );
  }

  double get totalPrice {
    return price * quantity;
  }

  @override
  String toString() {
    return 'CartItem(id: $id, title: $title, quantity: $quantity, price: $price, imageUrl: $imageUrl, color: $selectedColor, size: $selectedSize)';
  }
}
