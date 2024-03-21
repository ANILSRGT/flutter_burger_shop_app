import 'package:core/core.dart';
import 'package:flutter_burger_shop_app/features/order/domain/entities/order_entity.dart';

abstract class OrderRepository {
  Future<ResponseModel<String>> createOrder({required OrderEntity order});

  Future<ResponseModel<List<OrderEntity>>> getOrders();
  Future<ResponseModel<OrderEntity>> getOrder(String id);
}
