import 'package:core/core.dart';
import 'package:flutter_burger_shop_app/features/order/domain/entities/order_entity.dart';
import 'package:flutter_burger_shop_app/features/order/domain/repositories/order_repository.dart';

final class OrderGetByIdUseCase extends UseCaseWithParams<
    ResponseModel<OrderEntity>, OrderGetByIdUseCaseParams> {
  final OrderRepository _repository;

  OrderGetByIdUseCase({
    required OrderRepository repository,
  }) : _repository = repository;

  @override
  Future<ResponseModel<OrderEntity>> execute(
      OrderGetByIdUseCaseParams params) async {
    return _repository.getOrder(params.id);
  }
}

final class OrderGetByIdUseCaseParams {
  final String id;

  OrderGetByIdUseCaseParams({
    required this.id,
  });
}
