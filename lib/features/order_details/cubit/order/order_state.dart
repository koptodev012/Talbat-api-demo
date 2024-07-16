import 'package:talbat_api_demo/features/order_details/model/order_model.dart';

abstract class OrderState {}

class OrderInitial extends OrderState {}

class OrderLoaded extends OrderState {
  final List<Order> orders;

  OrderLoaded({required this.orders});
}

class OrderError extends OrderState {
  final String message;

  OrderError({required this.message});
}
