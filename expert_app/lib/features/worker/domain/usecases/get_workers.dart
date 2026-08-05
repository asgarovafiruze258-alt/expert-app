import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/worker_entity.dart';
import '../repositories/worker_repository.dart';

class GetWorkersParams {
  final String? categoryId;

  const GetWorkersParams({this.categoryId});
}

class GetWorkers implements UseCase<List<WorkerEntity>, GetWorkersParams> {
  final WorkerRepository repository;

  const GetWorkers(this.repository);

  @override
  Future<Either<Failure, List<WorkerEntity>>> call(GetWorkersParams params) {
    return repository.getWorkers(categoryId: params.categoryId);
  }
}
