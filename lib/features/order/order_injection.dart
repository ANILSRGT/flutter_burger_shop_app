import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_burger_shop_app/features/injection.dart';
import 'package:flutter_burger_shop_app/features/order/data/data_sources/remote/order_remote_data_source.dart';
import 'package:flutter_burger_shop_app/features/order/data/data_sources/remote/order_remote_data_source_impl.dart';
import 'package:flutter_burger_shop_app/features/order/data/repositories/order_repository_impl.dart';
import 'package:flutter_burger_shop_app/features/order/domain/repositories/order_repository.dart';
import 'package:flutter_burger_shop_app/features/order/domain/usecases/order_create_usecase.dart';
import 'package:flutter_burger_shop_app/features/order/domain/usecases/order_get_all_usecase.dart';
import 'package:flutter_burger_shop_app/features/order/domain/usecases/order_get_by_id_usecase.dart';
import 'package:get_it/get_it.dart';

final class OrderInjection extends Injection {
  @override
  Future<void> inject() async {
    final sl = GetIt.instance;

    //* Dependencies
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    //* Data sources
    final OrderRemoteDataSource orderRemoteDataSource =
        OrderRemoteDataSourceImpl(
      firestore: firestore,
    );

    //* Repositories
    final OrderRepository orderRepository = OrderRepositoryImpl(
      remoteDataSource: orderRemoteDataSource,
    );

    //* Use cases
    sl.registerSingleton(OrderCreateUseCase(repository: orderRepository));
    sl.registerSingleton(OrderGetAllUseCase(repository: orderRepository));
    sl.registerSingleton(OrderGetByIdUseCase(repository: orderRepository));
  }
}
