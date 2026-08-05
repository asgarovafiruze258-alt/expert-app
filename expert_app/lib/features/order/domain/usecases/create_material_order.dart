import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/cart_item_entity.dart';
import '../repositories/order_repository.dart';

class CreateMaterialOrderParams {
  final List<CartItemEntity> items;
  final String? address;
  final DateTime? scheduledDate;
  final String? notes;

  const CreateMaterialOrderParams({
    required this.items,
    this.address,
    this.scheduledDate,
    this.notes,
  });
}

class CreateMaterialOrder implements UseCase<Unit, CreateMaterialOrderParams> {
  final OrderRepository repository;

  const CreateMaterialOrder(this.repository);

  @override
  Future<Either<Failure, Unit>> call(CreateMaterialOrderParams params) {
    return repository.createMaterialOrder(
      items: params.items,
      address: params.address,
      scheduledDate: params.scheduledDate,
      notes: params.notes,
    );
  }
}
