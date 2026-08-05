import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/admin_repository.dart';

class ApproveShop implements UseCase<Unit, String> {
  final AdminRepository repository;

  const ApproveShop(this.repository);

  @override
  Future<Either<Failure, Unit>> call(String id) {
    return repository.approveShop(id);
  }
}
