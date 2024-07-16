import 'package:bloc/bloc.dart';
import 'package:talbat_api_demo/features/order_details/cubit/order/order_state.dart';
import 'package:talbat_api_demo/features/order_details/service/talbat_service.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(OrderInitial()) {
    fetchOrders();
  }

  //! ---------------------------------

  TalabatService talabatService =
      TalabatService(); // Create TalabatService object

  Future<void> fetchOrders() async {
    try {
      final orders = await talabatService.fetchOrders();

      emit(OrderLoaded(orders: orders));
    } catch (e) {
      emit(OrderError(message: e.toString()));
    }
  }
}
