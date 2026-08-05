import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../worker/domain/entities/worker_entity.dart';
import '../repositories/admin_repository.dart';

class GetAllWorkers implements UseCase<List<WorkerEntity>, NoParams> {
  final AdminRepository repository;

  const GetAllWorkers(this.repository);

  @override
  Future<Either<Failure, List<WorkerEntity>>> call(NoParams params) {
    return repository.getAllWorkers();
  }
}
