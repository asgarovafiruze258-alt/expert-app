import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../worker/domain/entities/worker_entity.dart';
import '../repositories/home_repository.dart';

class GetPopularWorkers implements UseCase<List<WorkerEntity>, NoParams> {
  final HomeRepository repository;

  const GetPopularWorkers(this.repository);

  @override
  Future<Either<Failure, List<WorkerEntity>>> call(NoParams params) {
    return repository.getPopularWorkers();
  }
}
