import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../order/domain/entities/order_entity.dart';
import '../repositories/admin_repository.dart';

class GetOrders implements UseCase<List<OrderEntity>, NoParams> {
  final AdminRepository repository;

  const GetOrders(this.repository);

  @override
  Future<Either<Failure, List<OrderEntity>>> call(NoParams params) {
    return repository.getOrders();
  }
}
