import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:core/core.dart';
import 'package:flutter_burger_shop_app/features/order/data/data_sources/remote/order_remote_data_source.dart';
import 'package:flutter_burger_shop_app/features/order/domain/entities/order_entity.dart';

final class OrderRemoteDataSourceImpl extends OrderRemoteDataSource {
  OrderRemoteDataSourceImpl({
    required FirebaseFirestore firestore,
  }) : _firestore = firestore;

  final FirebaseFirestore _firestore;

  CollectionReference get _ordersCollection => _firestore.collection('orders');

  @override
  Future<ResponseModel<String>> createOrder(
      {required OrderEntity order}) async {
    try {
      final orderMap = order.toJson();
      final orderRef = await _ordersCollection.add(orderMap);
      if (orderRef.id.isEmpty) {
        return const ResponseModelFail(
          message: "Failed to create order",
        );
      }

      return ResponseModelSuccess(data: orderRef.id);
    } catch (e) {
      return const ResponseModelFail(
        message: "An error occurred while creating order",
      );
    }
  }

  @override
  Future<ResponseModel<OrderEntity>> getOrder(String id) async {
    try {
      final orderSnapshot = await _ordersCollection.doc(id).get();
      if (!orderSnapshot.exists || orderSnapshot.data() == null) {
        return const ResponseModelFail(
          message: "Order not found",
        );
      }

      final order =
          OrderEntity.fromJson(orderSnapshot.data() as Map<String, dynamic>);
      return ResponseModelSuccess(data: order);
    } catch (e) {
      return const ResponseModelFail(
        message: "An error occurred while getting order",
      );
    }
  }

  @override
  Future<ResponseModel<List<OrderEntity>>> getOrders() async {
    try {
      final ordersSnapshot = await _ordersCollection.get();
      final orders = ordersSnapshot.docs
          .map((e) => OrderEntity.fromJson(e.data() as Map<String, dynamic>))
          .toList();
      return ResponseModelSuccess(data: orders);
    } catch (e) {
      return const ResponseModelFail(
        message: "An error occurred!",
      );
    }
  }
}
