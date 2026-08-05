import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure.dart';
import '../entities/cart_item_entity.dart';
import '../entities/order_entity.dart';

abstract class OrderRepository {
  Future<Either<Failure, OrderEntity>> createOrder({
    required OrderTargetType targetType,
    required String targetId,
    String? address,
    DateTime? scheduledDate,
    String? notes,
  });

  Future<Either<Failure, Unit>> createMaterialOrder({
    required List<CartItemEntity> items,
    String? address,
    DateTime? scheduledDate,
    String? notes,
  });
}
