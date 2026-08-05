import 'package:fpdart/fpdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/cart_item_entity.dart';
import '../../domain/entities/order_entity.dart';
import '../../domain/repositories/order_repository.dart';
import '../datasources/order_remote_datasource.dart';

class OrderRepositoryImpl implements OrderRepository {
  final OrderRemoteDataSource remoteDataSource;
  final SupabaseClient client;

  const OrderRepositoryImpl(this.remoteDataSource, this.client);

  Failure _mapException(Object error) {
    if (error is ServerException) return Failure.server(message: error.message);
    if (error is NetworkException) return Failure.network(message: error.message);
    return Failure.unexpected(message: error.toString());
  }

  @override
  Future<Either<Failure, OrderEntity>> createOrder({
    required OrderTargetType targetType,
    required String targetId,
    String? address,
    DateTime? scheduledDate,
    String? notes,
  }) async {
    try {
      final userId = client.auth.currentUser?.id;
      if (userId == null) {
        return const Left(Failure.unauthorized());
      }
      final model = await remoteDataSource.createOrder(
        customerId: userId,
        targetType: targetType.name,
        targetId: targetId,
        address: address,
        scheduledDate: scheduledDate?.toIso8601String(),
        notes: notes,
      );
      return Right(model.toEntity());
    } catch (e) {
      return Left(_mapException(e));
    }
  }

  @override
  Future<Either<Failure, Unit>> createMaterialOrder({
    required List<CartItemEntity> items,
    String? address,
    DateTime? scheduledDate,
    String? notes,
  }) async {
    try {
      final userId = client.auth.currentUser?.id;
      if (userId == null) {
        return const Left(Failure.unauthorized());
      }
      await remoteDataSource.createMaterialOrder(
        items: items
            .map((item) => {
                  'material_id': item.material.id,
                  'quantity': item.quantity,
                  'unit_price': item.unitPrice,
                })
            .toList(),
        address: address,
        scheduledDate: scheduledDate?.toIso8601String(),
        notes: notes,
      );
      return const Right(unit);
    } catch (e) {
      return Left(_mapException(e));
    }
  }
}
