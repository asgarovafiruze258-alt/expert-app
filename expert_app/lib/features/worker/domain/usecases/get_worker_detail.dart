import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/worker_entity.dart';
import '../repositories/worker_repository.dart';

class GetWorkerDetailParams {
  final String id;

  const GetWorkerDetailParams({required this.id});
}

class GetWorkerDetail implements UseCase<WorkerEntity, GetWorkerDetailParams> {
  final WorkerRepository repository;

  const GetWorkerDetail(this.repository);

  @override
  Future<Either<Failure, WorkerEntity>> call(GetWorkerDetailParams params) {
    return repository.getWorkerDetail(params.id);
  }
}
