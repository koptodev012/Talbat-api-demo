import 'package:dio/dio.dart';
import 'package:talbat_api_demo/common/variables.dart';
import 'package:talbat_api_demo/features/order_details/model/order_model.dart';

class TalabatService {
  final Dio dio;

  TalabatService()
      : dio = Dio(BaseOptions(
          baseUrl: CommonVariables.baseUrl,
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ${CommonVariables.apiKey}',
          },
        ));

  Future<List<Order>> fetchOrders() async {
    try {
      final response = await dio.get('/orders');
      if (response.statusCode == 200) {
        List jsonResponse = response.data;
        return jsonResponse.map((order) => Order.fromJson(order)).toList();
      } else {
        throw Exception('Failed to load orders');
      }
    } catch (e) {
      throw Exception('Failed to load orders: $e');
    }
  }
}
