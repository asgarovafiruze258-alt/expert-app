import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/order_entity.dart';
import '../repositories/order_repository.dart';

class CreateOrderParams {
  final OrderTargetType targetType;
  final String targetId;
  final String? address;
  final DateTime? scheduledDate;
  final String? notes;

  const CreateOrderParams({
    required this.targetType,
    required this.targetId,
    this.address,
    this.scheduledDate,
    this.notes,
  });
}

class CreateOrder implements UseCase<OrderEntity, CreateOrderParams> {
  final OrderRepository repository;

  const CreateOrder(this.repository);

  @override
  Future<Either<Failure, OrderEntity>> call(CreateOrderParams params) {
    return repository.createOrder(
      targetType: params.targetType,
      targetId: params.targetId,
      address: params.address,
      scheduledDate: params.scheduledDate,
      notes: params.notes,
    );
  }
}
