import 'package:core/core.dart';
import 'package:flutter_burger_shop_app/features/order/domain/entities/order_entity.dart';
import 'package:flutter_burger_shop_app/features/order/domain/entities/order_item_entity.dart';
import 'package:flutter_burger_shop_app/features/order/domain/repositories/order_repository.dart';

final class OrderCreateUseCase
    extends UseCaseWithParams<ResponseModel<String>, OrderCreateUseCaseParams> {
  final OrderRepository _repository;

  OrderCreateUseCase({
    required OrderRepository repository,
  }) : _repository = repository;

  @override
  Future<ResponseModel<String>> execute(
    OrderCreateUseCaseParams params,
  ) async {
    final order = OrderEntity(
      orderItems: params.orderItems,
      totalPrice: params.totalPrice,
    );
    return _repository.createOrder(order: order);
  }
}

final class OrderCreateUseCaseParams {
  final List<OrderItemEntity> orderItems;
  final double totalPrice;

  OrderCreateUseCaseParams({
    required this.orderItems,
    required this.totalPrice,
  });
}
