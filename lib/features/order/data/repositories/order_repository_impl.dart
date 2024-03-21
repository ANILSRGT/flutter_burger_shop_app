import 'package:core/core.dart';
import 'package:flutter_burger_shop_app/features/order/data/data_sources/remote/order_remote_data_source.dart';
import 'package:flutter_burger_shop_app/features/order/domain/entities/order_entity.dart';
import 'package:flutter_burger_shop_app/features/order/domain/repositories/order_repository.dart';

final class OrderRepositoryImpl extends OrderRepository {
  final OrderRemoteDataSource _remoteDataSource;

  OrderRepositoryImpl({
    required OrderRemoteDataSource remoteDataSource,
  }) : _remoteDataSource = remoteDataSource;

  @override
  Future<ResponseModel<String>> createOrder(
      {required OrderEntity order}) async {
    return _remoteDataSource.createOrder(order: order);
  }

  @override
  Future<ResponseModel<OrderEntity>> getOrder(String id) {
    return _remoteDataSource.getOrder(id);
  }

  @override
  Future<ResponseModel<List<OrderEntity>>> getOrders() {
    return _remoteDataSource.getOrders();
  }
}
