import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talbat_api_demo/features/order_details/cubit/order/order_cubit.dart';
import 'package:talbat_api_demo/features/order_details/cubit/order/order_state.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Talbat order details demo'),
      ),
      body: BlocBuilder<OrderCubit, OrderState>(
        builder: (context, state) {
          if (state is OrderInitial) {
            log("State --> $state");
            return const Center(
                child: Center(child: CircularProgressIndicator()));
          } else if (state is OrderLoaded) {
            log("State --> $state");

            return ListView.builder(
              itemCount: state.orders.length,
              itemBuilder: (context, index) {
                final order = state.orders[index];
                return ListTile(
                  title: Text(order.customerName),
                  subtitle: Text(order.items),
                );
              },
            );
          } else if (state is OrderError) {
            log("State --> $state");

            return Center(child: Text('Error: ${state.message}'));
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
