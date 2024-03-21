import 'package:core/core.dart';
import 'package:flutter_burger_shop_app/features/order/domain/entities/order_entity.dart';
import 'package:flutter_burger_shop_app/features/order/domain/repositories/order_repository.dart';

final class OrderGetAllUseCase
    extends UseCase<ResponseModel<List<OrderEntity>>> {
  final OrderRepository _repository;

  OrderGetAllUseCase({
    required OrderRepository repository,
  }) : _repository = repository;

  @override
  Future<ResponseModel<List<OrderEntity>>> execute() async {
    return _repository.getOrders();
  }
}
