import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure.dart';
import '../entities/worker_entity.dart';

abstract class WorkerRepository {
  Future<Either<Failure, List<WorkerEntity>>> getWorkers({String? categoryId});

  Future<Either<Failure, WorkerEntity>> getWorkerDetail(String id);
}
