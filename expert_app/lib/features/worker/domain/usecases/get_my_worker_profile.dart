import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/worker_entity.dart';
import '../repositories/worker_repository.dart';

class GetMyWorkerProfile implements UseCase<WorkerEntity?, NoParams> {
  final WorkerRepository repository;

  const GetMyWorkerProfile(this.repository);

  @override
  Future<Either<Failure, WorkerEntity?>> call(NoParams params) {
    return repository.getMyWorkerProfile();
  }
}
