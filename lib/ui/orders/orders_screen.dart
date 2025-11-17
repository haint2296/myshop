import 'package:flutter/material.dart';

import 'order_item_card.dart';
import 'orders_manager.dart';

import '../shared/app_drawer.dart';
import 'package:provider/provider.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text('Your Orders')),
      drawer: const AppDrawer(),
      body: Consumer<OrderManager>(
        builder: (_, orderManager, __) {
          return ListView.builder(
            itemCount: orderManager.orderCount,
            itemBuilder: (_, i) => OrderItemCard(orderManager.orders[i]),
          );
        },
      ),
    );
  }
}