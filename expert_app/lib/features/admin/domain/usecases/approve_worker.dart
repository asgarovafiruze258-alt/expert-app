import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/admin_repository.dart';

class ApproveWorker implements UseCase<Unit, String> {
  final AdminRepository repository;

  const ApproveWorker(this.repository);

  @override
  Future<Either<Failure, Unit>> call(String id) {
    return repository.approveWorker(id);
  }
}
